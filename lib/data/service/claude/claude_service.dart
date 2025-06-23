import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portfolio_eriel/domain/entities/__.dart';

/// Enhanced service for generating optimized resumes using Claude API
class ClaudeService {
  static const String _baseUrl = 'https://claude-proxy-56oomooeja-uc.a.run.app';
  static const String _defaultModel = 'claude-opus-4-20250514';
  static const Duration _timeout = Duration(seconds: 120);

  // Retry configuration
  static const int _maxRetries = 3;
  static const List<int> _retryDelays = [4, 8, 12];

  // Enhanced token limits
  static const int _maxTokensResume = 2500;
  static const int _maxTokensJobMatch = 2500;
  static const double _temperature = 0.3;

  // Cache for tech relevance scores
  final _techRelevanceCache = <String, double>{};

  // Known technology relationships for better matching
  final _techRelationships = {
    'dart': ['flutter'],
    'flutter': ['dart'],
    'python': ['django', 'flask'],
    'django': ['python'],
    'javascript': ['typescript', 'node.js', 'react', 'vue', 'angular'],
    'typescript': ['javascript'],
    'node.js': ['javascript', 'express'],
    'react': ['javascript', 'next.js'],
    'java': ['spring'],
    'spring': ['java'],
    'php': ['laravel'],
    'laravel': ['php'],
    'ruby': ['rails', 'ruby on rails'],
    'rails': ['ruby'],
    'ruby on rails': ['ruby'],
    'postgresql': ['postgres', 'postgis'],
    'postgres': ['postgresql'],
    'aws': ['amazon web services'],
    'amazon web services': ['aws'],
    'google maps': ['maps', 'geolocation'],
  };

  static const String _systemPromptResume = '''
You are Claude, an expert technical resume writer with deep understanding of ATS systems and technical recruiting.

Your expertise includes:
- Analyzing technical projects and extracting key achievements
- Matching candidate skills to target technologies
- Writing compelling, quantified bullet points
- Understanding technical career progression
- Creating ATS-optimized content

Always prioritize:
1. Technical relevance and skill demonstration
2. Quantifiable achievements and impact
3. Clear, professional language
4. ATS optimization with relevant keywords
''';

  static const String _systemPromptJobMatch = '''
You are Claude, an expert at matching candidate profiles to specific job requirements.

Your approach:
1. Parse job requirements to identify must-have vs nice-to-have skills
2. Analyze candidate projects for technical alignment
3. Prioritize projects that demonstrate required technologies
4. Highlight transferable skills and relevant experience
5. Create compelling narratives that connect candidate background to role

Focus on creating targeted, relevant resumes that clearly demonstrate fit for the specific position.
''';

  /// Enhanced project data preparation with scoring and ranking
  Future<List<Map<String, dynamic>>> _prepareEnhancedProjectsData(
      List<Project> projects, List<String> targetTechnologies) async {
    print('DEBUG: _prepareEnhancedProjectsData - Starting...');
    print(
        'DEBUG: _prepareEnhancedProjectsData - Input projects count: ${projects.length}');
    print(
        'DEBUG: _prepareEnhancedProjectsData - Input targetTechnologies: $targetTechnologies');

    // First pre-calculate all tech relevance scores in batches
    await _precalculateTechScores(projects, targetTechnologies);

    final List<Map<String, dynamic>> enrichedProjects = [];

    for (final project in projects) {
      print(
          'DEBUG: _prepareEnhancedProjectsData - Processing project: ${project.title}');

      final duration = _formatDuration(project.startDate, project.endDate);
      final description = _stripHtmlTags(project.description ?? '').trim();

      final projectData = {
        'id': project.id,
        'title': project.title.trim(),
        'subtitle': project.subtitle?.trim() ?? '',
        'role': project.subtitle?.trim() ?? 'Developer',
        'duration': duration,
        'techTags': project.techTags,
        'description': description,
        'priority': project.priority,
        'techRelevanceScore': _techRelevanceCache[
                _generateCacheKey(project.techTags, targetTechnologies)] ??
            0.0,
        'isPersonal': project.isPersonal,
        'projectType': project.projectType?.toString() ?? 'Unknown',
        'industries': project.industries,
        'salary': project.salary,
        'hasGithub': project.githubLink?.isNotEmpty ?? false,
        'hasAppLink': project.appLink?.isNotEmpty ?? false,
        'projectOwner': project.projectOwner ?? 'Self',
        'durationMonths':
            _calculateDurationInMonths(project.startDate, project.endDate),
      };
      enrichedProjects.add(projectData);
      print(
          'DEBUG: _prepareEnhancedProjectsData - Added project data: $projectData');
    }

    enrichedProjects.sort((a, b) {
      final priorityCompare =
          (b['priority'] as int).compareTo(a['priority'] as int);
      if (priorityCompare != 0) return priorityCompare;

      return (b['techRelevanceScore'] as double)
          .compareTo(a['techRelevanceScore'] as double);
    });

    print(
        'DEBUG: _prepareEnhancedProjectsData - Enriched projects after sorting: $enrichedProjects');
    print('DEBUG: _prepareEnhancedProjectsData - Finished.');
    return enrichedProjects;
  }

  /// Pre-calculate tech relevance scores for all projects in batches
  Future<void> _precalculateTechScores(
      List<Project> projects, List<String> targetTechnologies) async {
    print('DEBUG: _precalculateTechScores - Starting...');

    // Get all unique tech combinations from projects
    final uniqueTechCombinations = projects
        .map((p) => p.techTags)
        .toSet()
        .where((techs) =>
            _techRelevanceCache[_generateCacheKey(techs, targetTechnologies)] ==
            null)
        .toList();

    print(
        'DEBUG: _precalculateTechScores - Unique tech combinations to evaluate: ${uniqueTechCombinations.length}');

    // If all scores are already cached, skip
    if (uniqueTechCombinations.isEmpty) {
      print('DEBUG: _precalculateTechScores - All scores already cached');
      return;
    }

    // Batch calculate scores
    try {
      final batchScores = await _batchCalculateTechScores(
          uniqueTechCombinations, targetTechnologies);

      // Store all scores in cache
      batchScores.forEach((techs, score) {
        _techRelevanceCache[_generateCacheKey(techs, targetTechnologies)] =
            score;
      });

      print(
          'DEBUG: _precalculateTechScores - Successfully cached ${batchScores.length} scores');
    } catch (e) {
      print(
          'ERROR: _precalculateTechScores - Error batch calculating scores: $e');
      // Fall back to individual calculations
      for (final techs in uniqueTechCombinations) {
        final score =
            await _calculateTechRelevanceScoreImpl(techs, targetTechnologies);
        _techRelevanceCache[_generateCacheKey(techs, targetTechnologies)] =
            score;
      }
    }

    print('DEBUG: _precalculateTechScores - Finished.');
  }

  /// Batch calculate tech relevance scores for multiple tech combinations
  Future<Map<List<String>, double>> _batchCalculateTechScores(
      List<List<String>> projectTechsList, List<String> targetTechs) async {
    print('DEBUG: _batchCalculateTechScores - Starting...');

    if (projectTechsList.isEmpty) {
      return {};
    }

    // First try to calculate as many as possible locally
    final localScores = <List<String>, double>{};
    final remainingTechs = <List<String>>[];

    for (final techs in projectTechsList) {
      final localScore = _calculateBasicTechMatch(techs, targetTechs);
      if (localScore >= 0.7) {
        localScores[techs] = localScore;
      } else {
        remainingTechs.add(techs);
      }
    }

    print(
        'DEBUG: _batchCalculateTechScores - Calculated ${localScores.length} scores locally');

    // If we have remaining techs to evaluate, use AI
    if (remainingTechs.isNotEmpty) {
      print(
          'DEBUG: _batchCalculateTechScores - Evaluating ${remainingTechs.length} combinations with AI');

      final prompt = '''
Evaluate technical relevance between these project technologies and target technologies.
For each pair, return ONLY a decimal between 0.0 and 1.0 representing relevance.

Format your response as a JSON object where:
- Keys are comma-separated project technologies
- Values are relevance scores

Example response:
{
  "Flutter,Django,Python": 0.8,
  "React,Node.js": 0.6
}

**Target Technologies:** ${targetTechs.join(', ')}

**Project Technologies to Evaluate:**
${remainingTechs.map((techs) => techs.join(',')).join('\n')}

Scores:
''';

      final response = await _makeApiRequest(
        systemPrompt:
            'You are an expert in technology ecosystems. Return only a JSON object with relevance scores.',
        userPrompt: prompt,
        maxTokens: 1000,
      );

      print('DEBUG: _batchCalculateTechScores - AI raw response: $response');

      try {
        final scoresMap = jsonDecode(response) as Map<String, dynamic>;

        // Convert back to our tech list format
        scoresMap.forEach((key, value) {
          final techs = key.split(',').map((t) => t.trim()).toList();
          final score = (value as num).toDouble();
          localScores[techs] = score;
        });

        print(
            'DEBUG: _batchCalculateTechScores - Successfully parsed ${scoresMap.length} AI scores');
      } catch (e) {
        print(
            'ERROR: _batchCalculateTechScores - Failed to parse AI response: $e');
        throw Exception('Failed to parse batch scores response');
      }
    }

    print(
        'DEBUG: _batchCalculateTechScores - Finished with ${localScores.length} total scores');
    return localScores;
  }

  /// Enhanced tech relevance scoring using AI for semantic matching
  Future<double> _calculateTechRelevanceScore(
      List<String> projectTechs, List<String> targetTechs) async {
    print('DEBUG: _calculateTechRelevanceScore - Starting...');
    print('DEBUG: _calculateTechRelevanceScore - projectTechs: $projectTechs');
    print('DEBUG: _calculateTechRelevanceScore - targetTechs: $targetTechs');

    if (targetTechs.isEmpty || projectTechs.isEmpty) {
      print(
          'DEBUG: _calculateTechRelevanceScore - targetTechs or projectTechs is empty, returning 0.0');
      return 0.0;
    }

    // Check cache first
    final cacheKey = _generateCacheKey(projectTechs, targetTechs);
    if (_techRelevanceCache.containsKey(cacheKey)) {
      print(
          'DEBUG: _calculateTechRelevanceScore - Returning cached score: ${_techRelevanceCache[cacheKey]}');
      return _techRelevanceCache[cacheKey]!;
    }

    // Calculate and cache the score
    final score =
        await _calculateTechRelevanceScoreImpl(projectTechs, targetTechs);
    _techRelevanceCache[cacheKey] = score;

    return score;
  }

  /// Implementation of tech relevance scoring
  Future<double> _calculateTechRelevanceScoreImpl(
      List<String> projectTechs, List<String> targetTechs) async {
    // First try basic matching
    final basicScore = _calculateBasicTechMatch(projectTechs, targetTechs);
    if (basicScore >= 0.7) {
      return basicScore;
    }

    // If basic score not sufficient, use AI
    try {
      final prompt = '''
Score the technical relevance between these two technology lists:

**Target Technologies:** ${targetTechs.join(', ')}
**Project Technologies:** ${projectTechs.join(', ')}

Consider:
- Exact matches (highest score)
- Related technologies (e.g., React & Next.js, Node.js & Express)
- Same category/ecosystem (e.g., PostgreSQL & MySQL, AWS & Azure)
- Complementary skills (e.g., JavaScript & TypeScript)

Return ONLY a decimal number between 0.0 and 1.0 representing relevance score.
Examples: 0.8 for high relevance, 0.3 for low relevance, 0.0 for no relevance.

Score:''';
      print('DEBUG: _calculateTechRelevanceScore - AI prompt: $prompt');

      final response = await _makeApiRequest(
        systemPrompt:
            'You are an expert in technology ecosystems and relationships. Always return only a decimal number.',
        userPrompt: prompt,
        maxTokens: 50,
      );
      print('DEBUG: _calculateTechRelevanceScore - AI raw response: $response');

      final scoreMatch = RegExp(r'(\d+\.?\d*)').firstMatch(response.trim());
      if (scoreMatch != null) {
        final score = double.tryParse(scoreMatch.group(1)!) ?? 0.0;
        print('DEBUG: _calculateTechRelevanceScore - Parsed AI score: $score');
        return score.clamp(0.0, 1.0);
      } else {
        print(
            'DEBUG: _calculateTechRelevanceScore - No score found in AI response. Falling back to basic matching.');
      }
    } catch (e) {
      print(
          'DEBUG: _calculateTechRelevanceScore - AI scoring failed, using basic matching: $e');
    }

    // Fallback to basic exact matching
    return _calculateBasicTechMatch(projectTechs, targetTechs);
  }

  /// Calculate basic tech match score without API call
  double _calculateBasicTechMatch(
      List<String> projectTechs, List<String> targetTechs) {
    final projectTechsLower = projectTechs.map((t) => t.toLowerCase()).toSet();
    final targetTechsLower = targetTechs.map((t) => t.toLowerCase()).toSet();

    // Count exact matches
    double matches =
        projectTechsLower.intersection(targetTechsLower).length.toDouble();

    // Count related matches
    for (final targetTech in targetTechsLower) {
      if (!projectTechsLower.contains(targetTech)) {
        // Check if any related tech is in project
        final relatedTechs = _techRelationships[targetTech] ?? [];
        final relatedMatches = relatedTechs
            .where((related) => projectTechsLower.contains(related))
            .length;

        // Add partial score for related techs (max 0.5 per target tech)
        if (relatedMatches > 0) {
          matches +=
              0.5; // Only add 0.5 once per target tech, regardless of how many related techs match
        }
      }
    }

    final score = matches / targetTechs.length;
    print('DEBUG: _calculateBasicTechMatch - Calculated score: $score');
    return score.clamp(0.0, 1.0);
  }

  /// Generate cache key for tech combinations
  String _generateCacheKey(List<String> tech1, List<String> tech2) {
    final sortedTech1 = tech1.map((t) => t.toLowerCase()).toList()..sort();
    final sortedTech2 = tech2.map((t) => t.toLowerCase()).toList()..sort();
    return '${sortedTech1.join(',')}|${sortedTech2.join(',')}';
  }

  /// Calculate project duration in months
  int _calculateDurationInMonths(DateTime? startDate, DateTime? endDate) {
    if (startDate == null) return 0;
    final end = endDate ?? DateTime.now();
    final months = ((end.difference(startDate).inDays) / 30).round();
    print(
        'DEBUG: _calculateDurationInMonths - Start: $startDate, End: $endDate, Months: $months');
    return months;
  }

  /// Enhanced tech-focused prompt with intelligent project selection
  String _buildEnhancedTechPrompt({
    required List<Map<String, dynamic>> projectsData,
    required List<String> focusedTechStack,
    String? additionalContext,
  }) {
    print('DEBUG: _buildEnhancedTechPrompt - Starting...');
    print(
        'DEBUG: _buildEnhancedTechPrompt - projectsData (count): ${projectsData.length}');
    print(
        'DEBUG: _buildEnhancedTechPrompt - focusedTechStack: $focusedTechStack');
    print(
        'DEBUG: _buildEnhancedTechPrompt - additionalContext: $additionalContext');

    final projectsJson = jsonEncode(projectsData);
    final techStackString = focusedTechStack.join(', ');

    final prompt = '''
Create a professional technical resume targeting these specific technologies: **$techStackString**

## Candidate Information:
${additionalContext ?? 'Experienced software developer seeking opportunities in target technologies.'}

## Available Projects (sorted by priority and relevance):
$projectsJson

## Project Selection Criteria:
1. **PRIORITY FIRST**: Always consider projects with higher priority values (they are more important to the candidate)
2. **Technology Match**: Select projects that demonstrate the target technologies: $techStackString
3. **Relevance Score**: Each project has a techRelevanceScore - prioritize higher scores
4. **Diversity**: Show range of experience (different project types, industries, scales)
5. **Recency**: More recent projects are generally preferred unless priority indicates otherwise

## Resume Requirements:
- Select the **4-6 most relevant projects** based on the criteria above
- Create compelling bullet points that highlight:
  * Technical challenges solved
  * Specific technologies used from the target stack
  * Quantifiable results (use salary, duration, team size if available)
  * Professional growth and responsibility
- Write a strong Professional Summary connecting experience to target technologies
- Organize Technical Skills section with target technologies prominently featured
- Use action verbs and technical terminology appropriately

## Output Format:
Use the provided Markdown template structure. Focus on technical depth while maintaining professional presentation.

Remember: Priority values indicate candidate preference - respect this in your selection process.
''';
    print(
        'DEBUG: _buildEnhancedTechPrompt - Generated prompt (truncated): ${prompt.substring(0, prompt.length > 500 ? 500 : prompt.length)}...');
    print('DEBUG: _buildEnhancedTechPrompt - Finished.');
    return prompt;
  }

  /// Enhanced job-matching prompt with intelligent analysis
  Future<String> _buildEnhancedJobMatchPrompt({
    required List<Map<String, dynamic>> projectsData,
    required String jobDescription,
    String? additionalContext,
  }) async {
    print('DEBUG: _buildEnhancedJobMatchPrompt - Starting...');
    print(
        'DEBUG: _buildEnhancedJobMatchPrompt - projectsData (count): ${projectsData.length}');
    print(
        'DEBUG: _buildEnhancedJobMatchPrompt - jobDescription (length): ${jobDescription.length}');
    print(
        'DEBUG: _buildEnhancedJobMatchPrompt - additionalContext: $additionalContext');

    final projectsJson = jsonEncode(projectsData);
    final extractedRequirements = await _extractJobRequirements(jobDescription);
    print(
        'DEBUG: _buildEnhancedJobMatchPrompt - Extracted job requirements: $extractedRequirements');

    final prompt = '''
Create a targeted resume for this specific job opportunity:

## Job Analysis:
$extractedRequirements

## Full Job Description Context:
${jobDescription.length > 1000 ? jobDescription.substring(0, 1000) + '...' : jobDescription}

## Candidate Information:
${additionalContext ?? 'Experienced developer with diverse project portfolio.'}

## Available Projects (priority-sorted):
$projectsJson

## Selection Strategy:
1. **MANDATORY**: Respect project priority values - higher priority = more important to candidate
2. **Requirements Matching**: Identify projects that demonstrate required technologies and skills
3. **Experience Level**: Match project complexity to job seniority level
4. **Industry Relevance**: Consider industry alignment from project metadata
5. **Technical Depth**: Show progression and expertise in relevant areas

## Resume Customization:
- Professional Summary: Directly address the job requirements and value proposition
- Technical Skills: Mirror job requirements terminology where candidate has experience
- Project Selection: Choose 4-6 projects that best demonstrate job-relevant experience
- Achievement Focus: Emphasize outcomes that matter for this specific role
- Keywords: Naturally integrate job-relevant keywords throughout

## Quality Standards:
- Every bullet point should demonstrate relevant skills or achievements
- Use specific technologies mentioned in job description
- Quantify impact using available data (salary, duration, team size, etc.)
- Show career progression and increasing responsibility

Focus on creating a compelling narrative that positions the candidate as an ideal fit for this specific opportunity.
''';
    print(
        'DEBUG: _buildEnhancedJobMatchPrompt - Generated prompt (truncated): ${prompt.substring(0, prompt.length > 500 ? 500 : prompt.length)}...');
    print('DEBUG: _buildEnhancedJobMatchPrompt - Finished.');
    return prompt;
  }

  /// Extract and structure job requirements using AI
  Future<String> _extractJobRequirements(String jobDescription) async {
    print('DEBUG: _extractJobRequirements - Starting...');
    print(
        'DEBUG: _extractJobRequirements - Input jobDescription (length): ${jobDescription.length}');

    final prompt = '''
Analyze this job description and extract the key information in a structured format:

$jobDescription

Extract and organize the following information:

1. **REQUIRED/MANDATORY SKILLS**: Technologies, languages, frameworks that are explicitly required or essential
2. **EXPERIENCE REQUIREMENTS**: Years of experience, seniority level, specific experience types
3. **PREFERRED/NICE-TO-HAVE**: Skills that are preferred but not mandatory
4. **RESPONSIBILITIES**: Key job duties and what the person will be doing
5. **COMPANY/ROLE CONTEXT**: Industry, company size, team structure, work environment

Format your response exactly like this:

**Required Skills/Technologies:**
• [List each required skill on a separate line]

**Experience Requirements:**
• [List experience requirements]

**Preferred Skills:**
• [List preferred skills]

**Key Responsibilities:**
• [List main responsibilities]

**Role Context:**
• [Industry, company type, team info, etc.]

Be comprehensive but concise. Focus on technical requirements and concrete details.
''';
    print(
        'DEBUG: _extractJobRequirements - AI prompt (truncated): ${prompt.substring(0, prompt.length > 500 ? 500 : prompt.length)}...');

    try {
      final response = await _makeApiRequest(
        systemPrompt:
            'You are an expert HR analyst who specializes in parsing job descriptions and extracting key requirements in a structured format.',
        userPrompt: prompt,
        maxTokens: 800,
      );
      print('DEBUG: _extractJobRequirements - AI raw response: $response');
      final trimmedResponse = response.trim();
      print(
          'DEBUG: _extractJobRequirements - AI trimmed response: $trimmedResponse');
      print('DEBUG: _extractJobRequirements - Finished.');
      return trimmedResponse;
    } catch (e) {
      print(
          'ERROR: _extractJobRequirements - Error extracting job requirements: $e');
      // Fallback to basic extraction
      final basicRequirements = _extractJobRequirementsBasic(jobDescription);
      print(
          'DEBUG: _extractJobRequirements - Falling back to basic extraction. Result: $basicRequirements');
      return basicRequirements;
    }
  }

  /// Fallback method for basic job requirements extraction
  String _extractJobRequirementsBasic(String jobDescription) {
    print('DEBUG: _extractJobRequirementsBasic - Starting...');
    print(
        'DEBUG: _extractJobRequirementsBasic - Input jobDescription (length): ${jobDescription.length}');
    final lines = jobDescription.split('\n');
    final requirements = <String>[];
    final preferredSkills = <String>[];
    final experience = <String>[];

    for (final line in lines) {
      final lowerLine = line.toLowerCase().trim();
      if (lowerLine.isEmpty) continue;

      if (lowerLine.contains('required') ||
          lowerLine.contains('must have') ||
          lowerLine.contains('essential')) {
        requirements.add(line.trim());
      } else if (lowerLine.contains('preferred') ||
          lowerLine.contains('nice to have') ||
          lowerLine.contains('bonus')) {
        preferredSkills.add(line.trim());
      } else if (lowerLine.contains('year') &&
          lowerLine.contains('experience')) {
        experience.add(line.trim());
      }
    }
    final result = '''
**Required Skills/Technologies:**
${requirements.take(8).join('\n')}

**Experience Requirements:**
${experience.take(3).join('\n')}

**Preferred Skills:**
${preferredSkills.take(5).join('\n')}
''';
    print(
        'DEBUG: _extractJobRequirementsBasic - Basic extraction result: $result');
    print('DEBUG: _extractJobRequirementsBasic - Finished.');
    return result;
  }

  /// Utility methods (keeping existing ones)
  String _stripHtmlTags(String htmlText) {
    if (htmlText.isEmpty) return '';
    final exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    final stripped = htmlText.replaceAll(exp, '').trim();
    print(
        'DEBUG: _stripHtmlTags - Original: ${htmlText.length > 50 ? htmlText.substring(0, 50) : htmlText}, Stripped: ${stripped.length > 50 ? stripped.substring(0, 50) : stripped}');
    return stripped;
  }

  String _formatDuration(DateTime? startDate, DateTime? endDate) {
    if (startDate == null) {
      print(
          'DEBUG: _formatDuration - Start date is null, returning empty string.');
      return '';
    }
    final start = '${startDate.month}/${startDate.year}';
    final end =
        endDate != null ? '${endDate.month}/${endDate.year}' : 'Present';
    final formatted = '$start - $end';
    print(
        'DEBUG: _formatDuration - Start: $startDate, End: $endDate, Formatted: $formatted');
    return formatted;
  }

  /// Enhanced API request method (keeping existing retry logic)
  Future<String> _makeApiRequest({
    required String systemPrompt,
    required String userPrompt,
    required int maxTokens,
  }) async {
    print('DEBUG: _makeApiRequest - Starting API request...');
    print('DEBUG: _makeApiRequest - URL: $_baseUrl');
    print('DEBUG: _makeApiRequest - Model: $_defaultModel');
    print('DEBUG: _makeApiRequest - Max Tokens: $maxTokens');
    print('DEBUG: _makeApiRequest - Temperature: $_temperature');
    print(
        'DEBUG: _makeApiRequest - System Prompt (truncated): ${systemPrompt.substring(0, systemPrompt.length > 100 ? 100 : systemPrompt.length)}...');
    print(
        'DEBUG: _makeApiRequest - User Prompt (truncated): ${userPrompt.substring(0, userPrompt.length > 100 ? 100 : userPrompt.length)}...');

    await Future.delayed(const Duration(milliseconds: 500));

    for (int attempt = 0; attempt < _maxRetries; attempt++) {
      print('DEBUG: _makeApiRequest - Attempt ${attempt + 1}/$_maxRetries');
      try {
        final requestBody = jsonEncode({
          'model': _defaultModel,
          'max_tokens': maxTokens,
          'temperature': _temperature,
          'system': systemPrompt,
          'messages': [
            {'role': 'user', 'content': userPrompt}
          ],
        });
        print(
            'DEBUG: _makeApiRequest - Request Body (truncated): ${requestBody.substring(0, requestBody.length > 200 ? 200 : requestBody.length)}...');

        final response = await http
            .post(
              Uri.parse(_baseUrl),
              headers: {
                'Content-Type': 'application/json',
                'anthropic-version': 'extended-thinking-2025-05-14',
              },
              body: requestBody,
            )
            .timeout(_timeout);

        print(
            'DEBUG: _makeApiRequest - Response Status Code: ${response.statusCode}');
        print(
            'DEBUG: _makeApiRequest - Response Body (truncated): ${response.body.substring(0, response.body.length > 200 ? 200 : response.body.length)}...');

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final content = data['content']?[0]?['text'];
          if (content == null || content.isEmpty) {
            print(
                'ERROR: _makeApiRequest - Empty or null content in API response.');
            throw Exception('Empty response from API');
          }
          print(
              'DEBUG: _makeApiRequest - API request successful. Content (truncated): ${content.substring(0, content.length > 100 ? 100 : content.length)}...');
          return content;
        }

        final errorData = _parseErrorResponse(response.body);
        print('DEBUG: _makeApiRequest - API error data: $errorData');
        if (_shouldRetry(
            response.statusCode, errorData['type'] ?? '', attempt)) {
          final delay = _retryDelays[attempt];
          print(
              'DEBUG: _makeApiRequest - Retrying in $delay seconds due to status ${response.statusCode} or error type ${errorData['type']}.');
          await Future.delayed(Duration(seconds: delay));
          continue;
        }

        print(
            'ERROR: _makeApiRequest - API request failed after ${attempt + 1} attempts. Message: ${errorData['message'] ?? 'API request failed'}');
        throw Exception(errorData['message'] ?? 'API request failed');
      } on TimeoutException {
        print('ERROR: _makeApiRequest - TimeoutException caught.');
        if (attempt < _maxRetries - 1) {
          final delay = _retryDelays[attempt];
          print(
              'DEBUG: _makeApiRequest - Retrying after timeout in $delay seconds.');
          await Future.delayed(Duration(seconds: delay));
          continue;
        }
        print(
            'ERROR: _makeApiRequest - Request timeout after $_maxRetries attempts.');
        throw Exception('Request timeout after $_maxRetries attempts');
      } catch (e) {
        print('ERROR: _makeApiRequest - General exception caught: $e');
        if (attempt < _maxRetries - 1 && _isRetryableError(e.toString())) {
          final delay = _retryDelays[attempt];
          print(
              'DEBUG: _makeApiRequest - Retrying after retryable error in $delay seconds.');
          await Future.delayed(Duration(seconds: delay));
          continue;
        }
        print(
            'ERROR: _makeApiRequest - Non-retryable error or max retries reached. Rethrowing.');
        rethrow;
      }
    }

    print('ERROR: _makeApiRequest - Failed after $_maxRetries attempts.');
    throw Exception('Failed after $_maxRetries attempts');
  }

  /// Utility methods for error handling (keeping existing)
  Map<String, String> _parseErrorResponse(String responseBody) {
    print(
        'DEBUG: _parseErrorResponse - Parsing error response body: ${responseBody.length > 100 ? responseBody.substring(0, 100) : responseBody}...');
    try {
      final data = jsonDecode(responseBody);
      print('DEBUG: _parseErrorResponse - Parsed error: $responseBody');
      return {
        'type': data['error']?['type'] ?? 'unknown_error',
        'message': data['error']?['message'] ?? 'Unknown error occurred',
      };
    } catch (_) {
      print(
          'ERROR: _parseErrorResponse - Failed to parse error response body. Returning default error.');
      return {
        'type': 'parse_error',
        'message': 'Failed to parse error response',
      };
    }
  }

  bool _shouldRetry(int statusCode, String errorType, int attempt) {
    print(
        'DEBUG: _shouldRetry - Status: $statusCode, ErrorType: $errorType, Attempt: $attempt');
    if (attempt >= _maxRetries - 1) {
      print('DEBUG: _shouldRetry - Max retries reached or exceeded.');
      return false;
    }
    final retry = statusCode == 503 ||
        statusCode == 429 ||
        statusCode == 504 ||
        errorType == 'overloaded_error' ||
        errorType == 'rate_limit_error' ||
        errorType == 'timeout_error';
    print('DEBUG: _shouldRetry - Should retry: $retry');
    return retry;
  }

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
    final isRetryable =
        retryableErrors.any((e) => error.toLowerCase().contains(e));
    print(
        'DEBUG: _isRetryableError - Error message: $error, Is retryable: $isRetryable');
    return isRetryable;
  }

  /// Enhanced resume generation with intelligent project selection
  Future<String> generateResumeContent({
    required List<Project> projects,
    required List<String> focusedTechStack,
    String? additionalContext,
  }) async {
    print('DEBUG: generateResumeContent - Starting...');
    print(
        'DEBUG: generateResumeContent - Input projects count: ${projects.length}');
    print(
        'DEBUG: generateResumeContent - Focused Tech Stack: $focusedTechStack');
    print(
        'DEBUG: generateResumeContent - Additional Context: $additionalContext');

    if (projects.isEmpty) {
      print('ERROR: generateResumeContent - Projects list is empty.');
      throw ArgumentError('Projects list cannot be empty');
    }

    final projectsData =
        await _prepareEnhancedProjectsData(projects, focusedTechStack);
    print(
        'DEBUG: generateResumeContent - Prepared projects data count: ${projectsData.length}');

    final prompt = _buildEnhancedTechPrompt(
      projectsData: projectsData,
      focusedTechStack: focusedTechStack,
      additionalContext: additionalContext,
    );
    print(
        'DEBUG: generateResumeContent - Generated tech prompt (truncated): ${prompt.substring(0, prompt.length > 200 ? 200 : prompt.length)}...');

    final resumeContent = await _makeApiRequest(
      systemPrompt: _systemPromptResume,
      userPrompt: prompt,
      maxTokens: _maxTokensResume,
    );
    print(
        'DEBUG: generateResumeContent - Final generated resume content (truncated): ${resumeContent.substring(0, resumeContent.length > 200 ? 200 : resumeContent.length)}...');
    print('DEBUG: generateResumeContent - Finished.');
    return resumeContent;
  }

  /// Enhanced job-tailored resume generation
  Future<String> generateResumeFromJobDescription({
    required List<Project> projects,
    required String jobDescription,
    String? additionalContext,
  }) async {
    print('DEBUG: generateResumeFromJobDescription - Starting...');
    print(
        'DEBUG: generateResumeFromJobDescription - Input projects count: ${projects.length}');
    print(
        'DEBUG: generateResumeFromJobDescription - Job Description (length): ${jobDescription.length}');
    print(
        'DEBUG: generateResumeFromJobDescription - Additional Context: $additionalContext');

    if (projects.isEmpty || jobDescription.trim().isEmpty) {
      print(
          'ERROR: generateResumeFromJobDescription - Projects list or job description is empty.');
      throw ArgumentError('Projects and job description are required');
    }

    // Extract technologies from job description for relevance scoring
    final jobTechnologies =
        await _extractTechnologiesFromJobDescription(jobDescription);
    print(
        'DEBUG: generateResumeFromJobDescription - Extracted job technologies: $jobTechnologies');

    final projectsData =
        await _prepareEnhancedProjectsData(projects, jobTechnologies);
    print(
        'DEBUG: generateResumeFromJobDescription - Prepared projects data for job match count: ${projectsData.length}');

    final prompt = await _buildEnhancedJobMatchPrompt(
      projectsData: projectsData,
      jobDescription: jobDescription,
      additionalContext: additionalContext,
    );
    print(
        'DEBUG: generateResumeFromJobDescription - Generated job match prompt (truncated): ${prompt.substring(0, prompt.length > 200 ? 200 : prompt.length)}...');

    final resumeContent = await _makeApiRequest(
      systemPrompt: _systemPromptJobMatch,
      userPrompt: prompt,
      maxTokens: _maxTokensJobMatch,
    );
    print(
        'DEBUG: generateResumeFromJobDescription - Final generated job-tailored resume content (truncated): ${resumeContent.substring(0, resumeContent.length > 200 ? 200 : resumeContent.length)}...');
    print('DEBUG: generateResumeFromJobDescription - Finished.');
    return resumeContent;
  }

  /// Extract technologies mentioned in job description using AI
  Future<List<String>> _extractTechnologiesFromJobDescription(
      String jobDescription) async {
    print('DEBUG: _extractTechnologiesFromJobDescription - Starting...');
    print(
        'DEBUG: _extractTechnologiesFromJobDescription - Input jobDescription (length): ${jobDescription.length}');

    final prompt = '''
Analyze this job description and extract ALL technologies, programming languages, frameworks, tools, and technical skills mentioned:

$jobDescription

Return ONLY a JSON array of technology names, like this:
["React", "Node.js", "PostgreSQL", "AWS", "Docker"]

Be comprehensive and include:
- Programming languages
- Frameworks and libraries
- Databases
- Cloud platforms
- DevOps tools
- Testing frameworks
- Any other technical tools or technologies

Return only the JSON array, no additional text.
''';
    print(
        'DEBUG: _extractTechnologiesFromJobDescription - AI prompt (truncated): ${prompt.substring(0, prompt.length > 200 ? 200 : prompt.length)}...');

    try {
      final response = await _makeApiRequest(
        systemPrompt:
            'You are an expert at extracting technical information from job descriptions. Always return valid JSON arrays.',
        userPrompt: prompt,
        maxTokens: 500,
      );
      print(
          'DEBUG: _extractTechnologiesFromJobDescription - AI raw response: $response');

      // Clean the response to extract just the JSON array
      final cleanResponse = response.trim();
      final jsonMatch =
          RegExp(r'\[.*\]', dotAll: true).firstMatch(cleanResponse);

      List<String> techList = [];
      if (jsonMatch != null) {
        final jsonString = jsonMatch.group(0)!;
        print(
            'DEBUG: _extractTechnologiesFromJobDescription - Extracted JSON string: $jsonString');
        final List<dynamic> parsedList = jsonDecode(jsonString);
        techList = parsedList.map((tech) => tech.toString()).toList();
      } else {
        // Fallback: try to parse the entire response as JSON
        print(
            'DEBUG: _extractTechnologiesFromJobDescription - No direct JSON array match, attempting to parse entire response as JSON.');
        final List<dynamic> parsedList = jsonDecode(cleanResponse);
        techList = parsedList.map((tech) => tech.toString()).toList();
      }
      print(
          'DEBUG: _extractTechnologiesFromJobDescription - Parsed tech list: $techList');
      print('DEBUG: _extractTechnologiesFromJobDescription - Finished.');
      return techList;
    } catch (e) {
      print(
          'ERROR: _extractTechnologiesFromJobDescription - Error extracting technologies: $e');
      // Fallback to basic keyword extraction
      final basicTechs = _extractTechnologiesBasic(jobDescription);
      print(
          'DEBUG: _extractTechnologiesFromJobDescription - Falling back to basic extraction. Result: $basicTechs');
      return basicTechs;
    }
  }

  /// Fallback method for basic technology extraction
  List<String> _extractTechnologiesBasic(String jobDescription) {
    print('DEBUG: _extractTechnologiesBasic - Starting...');
    print(
        'DEBUG: _extractTechnologiesBasic - Input jobDescription (length): ${jobDescription.length}');
    final commonTechs = [
      'JavaScript',
      'TypeScript',
      'Python',
      'Java',
      'C#',
      'C++',
      'Go',
      'Rust',
      'PHP',
      'React',
      'Vue',
      'Angular',
      'Node.js',
      'Express',
      'Django',
      'Flask',
      'Spring',
      'AWS',
      'Azure',
      'GCP',
      'Docker',
      'Kubernetes',
      'PostgreSQL',
      'MongoDB',
      'Redis',
      'Git',
      'Jenkins',
      'GraphQL',
      'REST',
      'Microservices',
      'SQL',
      'NoSQL',
      'Linux',
      'Flutter',
      'Dart',
      'Swift',
      'Kotlin',
      'Firebase',
      'Supabase',
      'Vercel',
      'Netlify'
    ];

    final foundTechs = <String>[];
    final jobLower = jobDescription.toLowerCase();

    for (final tech in commonTechs) {
      if (jobLower.contains(tech.toLowerCase())) {
        foundTechs.add(tech);
      }
    }
    print('DEBUG: _extractTechnologiesBasic - Found technologies: $foundTechs');
    print('DEBUG: _extractTechnologiesBasic - Finished.');
    return foundTechs;
  }
}
