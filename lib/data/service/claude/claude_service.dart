import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:portfolio_eriel/domain/entities/__.dart';

const _MarkdownCV = """
**Your Name**  
Home Street Address • City, State Zip • name@college.harvard.edu • phone number 

**Education**  
**HARVARD UNIVERSITY** 							                       Cambridge, MA  
Degree, Concentration. GPA \[Note: Optional\] 						          Graduation Date  
Thesis \[Note: Optional\]  
Relevant Coursework: \[Note: Optional. Awards and honors can also be listed here.\]

**STUDY ABROAD** \[Note: If Applicable\]					   	 	 City, Country  
Study abroad coursework in \_\_\_\_\_.					 	      Month Year – Month Year

**NAME OF HIGH SCHOOL** 						      		      	      City, State  
\[Note: May include GPA, SAT scores, or academic honors an employer may want to know\]       Graduation Date	      

**Experience**  
**ORGANIZATION**							           	            		      City, State  
**Position Title**			 						      Month Year – Month Year

* Beginning with your most recent position, describe your experience, skills, and resulting outcomes in bullet or paragraph form.   
* Begin each line with an action verb and include details that will help the reader understand your accomplishments, skills, knowledge, abilities, or achievements.   
* Quantify where possible.   
* Do not use personal pronouns; each line should be a phrase rather than full sentence.

**ORGANIZATION**							           	            		      City, State  
**Position Title**			 						      Month Year – Month Year

* With your next-most recent position, describe your experience, skills, and resulting outcomes in bullet or paragraph form.   
* Begin each line with an action verb and include details that will help the reader understand your accomplishments, skills, knowledge, abilities, or achievements.   
* Quantify where possible.   
* Do not use personal pronouns; each line should be a phrase rather than full sentence.

**Leadership and Activities**  
**ORGANIZATION**										      City, State  
**Role**				 						      Month Year – Month Year

* This section can be formatted similarly to the Experience section, or you can omit descriptions for activities.   
* If this section is more relevant to the opportunity you are applying for, consider moving this above your Experience section.

**Skills & Interests** \[Note: Optional\]  
**Technical:** List computer software and programming languages  
**Language:** List foreign languages and your level of fluency  
**Laboratory:** List scientific / research lab techniques or tools \[If Applicable\]  
**Interests:** List activities you enjoy that may spark interview conversation 

""";

/// Service for interacting with Claude API - Optimized to prevent overload
class ClaudeService {
  static const String _baseUrl = 'https://claude-proxy-56oomooeja-uc.a.run.app';
  static const String _defaultModel = 'claude-3-5-haiku-20241022';
  static const Duration _timeout = Duration(seconds: 30);

  // Retry configuration
  static const int _maxRetries = 3;
  static const List<int> _retryDelays = [3, 8, 15]; // Increased delays

  // Reduced token limits to prevent overload
  static const int _maxTokensResume = 800; // Reduced from 1500
  static const int _maxTokensJobMatch = 1000; // Reduced from 2000
  static const double _temperature = 0.7;

  // Compact system prompts
  static const String _systemPromptResume =
      'Expert tech resume writer. Create ATS-optimized Markdown resumes with clear structure, quantified achievements, and relevant keywords.';

  static const String _systemPromptJobMatch =
      'Resume expert. Match job requirements to candidate experience. Create tailored resumes highlighting relevant skills.';

  /// Strips HTML tags from text
  String _stripHtmlTags(String htmlText) {
    if (htmlText.isEmpty) return '';
    final exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '').trim();
  }

  /// Formats date duration for resume
  String _formatDuration(DateTime? startDate, DateTime? endDate) {
    if (startDate == null) return '';

    final start = '${startDate.month}/${startDate.year}';
    final end =
        endDate != null ? '${endDate.month}/${endDate.year}' : 'Present';

    return '$start-$end';
  }

  /// Converts projects to COMPACT data structure
  List<Map<String, dynamic>> _prepareProjectsData(List<Project> projects,
      {int maxProjects = 5}) {
    return projects
        .take(maxProjects) // Limit number of projects
        .map((project) => {
              'title': project.title?.trim() ?? '',
              'role': project.subtitle?.trim() ?? '',
              'tech':
                  (project.techTags ?? []).take(5).toList(), // Limit tech tags
              'duration': _formatDuration(project.startDate, project.endDate),
              // Compact description
              'summary': _getCompactSummary(project.description ?? ''),
            })
        .where((p) => p['title'].toString().isNotEmpty)
        .toList();
  }

  /// Gets a compact summary from description
  String _getCompactSummary(String description) {
    final cleaned = _stripHtmlTags(description);
    if (cleaned.isEmpty) return '';

    // Get first meaningful sentence only
    final sentences = cleaned.split(RegExp(r'[.!?]'));
    for (final sentence in sentences) {
      final trimmed = sentence.trim();
      if (trimmed.length > 20 && trimmed.length < 150) {
        return trimmed;
      }
    }

    // Fallback: truncate
    return cleaned.length > 100 ? '${cleaned.substring(0, 97)}...' : cleaned;
  }

  /// Smart data truncation
  String _truncateData(dynamic data, int maxLength) {
    final jsonStr = jsonEncode(data);
    if (jsonStr.length <= maxLength) return jsonStr;

    if (data is List && data.isNotEmpty) {
      // Progressively reduce items until it fits
      for (int i = data.length; i > 0; i--) {
        final truncated = jsonEncode(data.take(i).toList());
        if (truncated.length <= maxLength) {
          return truncated;
        }
      }
    }

    return jsonEncode([data is List ? data.first : data]);
  }

  /// Makes API request with better error handling
  Future<String> _makeApiRequest({
    required String systemPrompt,
    required String userPrompt,
    required int maxTokens,
  }) async {
    // Add initial delay to avoid bursts
    await Future.delayed(const Duration(milliseconds: 500));

    for (int attempt = 0; attempt < _maxRetries; attempt++) {
      try {
        final response = await http
            .post(
              Uri.parse(_baseUrl),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode({
                'model': _defaultModel,
                'max_tokens': maxTokens,
                'temperature': _temperature,
                'system': systemPrompt,
                'messages': [
                  {'role': 'user', 'content': userPrompt}
                ],
              }),
            )
            .timeout(_timeout);

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final content = data['content']?[0]?['text'];
          if (content == null || content.isEmpty) {
            throw Exception('Empty response from API');
          }
          return content;
        }

        // Parse error
        final errorData = _parseErrorResponse(response.body);
        print(
            'API Error (attempt ${attempt + 1}): ${errorData['type']} - ${errorData['message']}');

        if (_shouldRetry(
            response.statusCode, errorData['type'] ?? '', attempt)) {
          final delay = _retryDelays[attempt];
          print('Retrying in $delay seconds...');
          await Future.delayed(Duration(seconds: delay));
          continue;
        }

        throw Exception(errorData['message'] ?? 'API request failed');
      } on TimeoutException {
        print('Timeout on attempt ${attempt + 1}');
        if (attempt < _maxRetries - 1) {
          await Future.delayed(Duration(seconds: _retryDelays[attempt]));
          continue;
        }
        throw Exception('Request timeout after $_maxRetries attempts');
      } catch (e) {
        print('Error on attempt ${attempt + 1}: $e');
        if (attempt < _maxRetries - 1 && _isRetryableError(e.toString())) {
          await Future.delayed(Duration(seconds: _retryDelays[attempt]));
          continue;
        }
        rethrow;
      }
    }

    throw Exception('Failed after $_maxRetries attempts');
  }

  /// Parses error response from API
  Map<String, String> _parseErrorResponse(String responseBody) {
    try {
      final data = jsonDecode(responseBody);
      return {
        'type': data['error']?['type'] ?? 'unknown_error',
        'message': data['error']?['message'] ?? 'Unknown error occurred',
      };
    } catch (_) {
      return {
        'type': 'parse_error',
        'message': 'Failed to parse error response',
      };
    }
  }

  /// Determines if request should be retried
  bool _shouldRetry(int statusCode, String errorType, int attempt) {
    if (attempt >= _maxRetries - 1) return false;

    return statusCode == 503 ||
        statusCode == 429 ||
        statusCode == 504 ||
        errorType == 'overloaded_error' ||
        errorType == 'rate_limit_error' ||
        errorType == 'timeout_error';
  }

  /// Checks if error is retryable
  bool _isRetryableError(String error) {
    final retryableErrors = [
      'overloaded',
      'timeout',
      'connection',
      'socket',
      'rate limit',
      '503',
      '429',
    ];

    final errorLower = error.toLowerCase();
    return retryableErrors.any((e) => errorLower.contains(e));
  }

  /// Generates resume with compact data
  Future<String> generateResumeContent({
    required List<Project> projects,
    required List<String> focusedTechStack,
    String? additionalContext,
  }) async {
    if (projects.isEmpty) {
      throw ArgumentError('Projects list cannot be empty');
    }

    try {
      // Prepare compact data
      final projectsData = _prepareProjectsData(projects, maxProjects: 5);
      final truncatedProjects =
          _truncateData(projectsData, 1500); // Reduced from 3000

      // Compact user prompt
      final userPrompt = '''
            Resume for ${focusedTechStack.join(', ')}.

            PROJECTS:
            $truncatedProjects
            
            ADDITIONAL CONTEXT:
            $additionalContext
                       
            * Create Markdown resume with: Summary, Skills, Experience (5 projects max), Education.''';

      return await _makeApiRequest(
        systemPrompt: _systemPromptResume,
        userPrompt: userPrompt,
        maxTokens: _maxTokensResume,
      );
    } catch (e) {
      throw Exception('Resume generation failed: ${e.toString()}');
    }
  }

  /// Generates job-tailored resume with compact data
  Future<String> generateResumeFromJobDescription({
    required List<Project> projects,
    required String jobDescription,
    String? additionalContext,
  }) async {
    if (projects.isEmpty || jobDescription.trim().isEmpty) {
      throw ArgumentError('Projects and job description are required');
    }

    try {
      // Prepare very compact data
      final projectsData = _prepareProjectsData(projects, maxProjects: 4);
      final truncatedProjects = _truncateData(projectsData, 1200);

      // Extract key job requirements only
      final jobKeywords = _extractKeywords(jobDescription);
      final truncatedJob = jobKeywords.length > 500
          ? '${jobKeywords.substring(0, 497)}...'
          : jobKeywords;

      final userPrompt = '''
          Match resume to job:

          JOB KEY REQUIREMENTS:
          $truncatedJob
          
          MY PROJECTS:
          $truncatedProjects
          
          ADDITIONAL CONTEXT:
          $additionalContext
          
          Create targeted Markdown resume focusing on job match.''';

      return await _makeApiRequest(
        systemPrompt: _systemPromptJobMatch,
        userPrompt: userPrompt,
        maxTokens: _maxTokensJobMatch,
      );
    } catch (e) {
      throw Exception('Job-tailored resume generation failed: ${e.toString()}');
    }
  }

  /// Extract key requirements from job description
  String _extractKeywords(String jobDescription) {
    // Simple keyword extraction - just get important sentences
    final lines = jobDescription.split('\n');
    final keywords = <String>[];

    for (final line in lines) {
      final lower = line.toLowerCase();
      if (lower.contains('require') ||
          lower.contains('must have') ||
          lower.contains('experience') ||
          lower.contains('skill') ||
          lower.contains('years')) {
        keywords.add(line.trim());
      }
    }

    return keywords.take(5).join('\n');
  }

  /// Simpler job analysis
  Future<Map<String, dynamic>> analyzeJobDescription(
      String jobDescription) async {
    try {
      final truncatedJob = jobDescription.length > 800
          ? jobDescription.substring(0, 800)
          : jobDescription;

      final prompt = '''Extract from job description:
$truncatedJob

List: 1) Required skills 2) Nice-to-have 3) Experience level''';

      final result = await _makeApiRequest(
        systemPrompt: 'Job analyzer. Extract key requirements concisely.',
        userPrompt: prompt,
        maxTokens: 400, // Reduced
      );

      return {'analysis': result};
    } catch (e) {
      throw Exception('Job analysis failed: ${e.toString()}');
    }
  }
}
