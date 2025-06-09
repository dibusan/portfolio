import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio_eriel/domain/entities/__.dart';

// Service for interacting with Claude API
class ClaudeService {

  String _stripHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  String _formatDuration(DateTime? startDate, DateTime? endDate) {
    if (startDate == null) return 'N/A';

    final start = startDate.toIso8601String().substring(0, 7);
    final end = endDate != null
        ? endDate.toIso8601String().substring(0, 7)
        : 'Present';

    return '$start to $end';
  }

  Future<String> generateResumeContent({
    required List<Project> projects,
    required List<String> focusedTechStack,
    String? additionalContext,
  }) async {
    try {
      // Build the prompt
      final prompt =
          "Create a professional resume focused on this tech stack: $focusedTechStack and using this json that highlights my past projects $projects. This is some additional context: $additionalContext";

      // Call your Firebase function instead of Anthropic API directly
      final response = await http.post(
        // Uri.parse('https://us-central1-YOUR_PROJECT_ID.cloudfunctions.net/claude_proxy'),
        Uri.parse('https://claude-proxy-56oomooeja-uc.a.run.app'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'model': 'claude-3-5-haiku-20241022',
          // 'model': 'claude-3-opus-20240229',
          'max_tokens': 1500,
          'system': 'You are an expert resume writer and career consultant. Create professional, compelling resumes that highlight achievements and skills effectively. Use action verbs, quantify accomplishments when possible, and tailor content to showcase relevant experience. Format responses in clear, professional resume structure.',
          'messages': [
            {'role': 'user', 'content': prompt},
          ]
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['content'][0]['text'];
      } else {
        throw Exception('Failed to generate resume: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error generating resume: $e');
    }
  }

  Future<String> generateResumeFromJobDescription({
    required List<Project> projects,
    required String jobDescription,
    String? additionalContext,
  }) async {
    try {
      // Prepare the projects data in a cleaner format for the prompt
      final projectsData = projects.map((project) {
        return {
          'title': project.title,
          'role': project.subtitle,
          'company': project.projectOwner,
          'description': _stripHtmlTags(project.description ?? ''),
          'technologies': project.techTags,
          'duration': _formatDuration(project.startDate, project.endDate),
        };
      }).toList();

      // Build the prompt for Claude with job description analysis
      final prompt = """
Based on the following job description, analyze the key technical skills, technologies, and requirements mentioned, then create a professional resume that highlights the most relevant experience from my project portfolio.

JOB DESCRIPTION:
${jobDescription}

MY PROJECT PORTFOLIO:
${jsonEncode(projectsData)}

${additionalContext ?? ''}

Instructions:
1. First, identify the key technologies, skills, and requirements from the job description
2. Prioritize and highlight the most relevant projects and experiences that match the job requirements
3. Create a professional resume that emphasizes the technologies and skills mentioned in the job description
4. Format the resume with clear sections for:
   - Professional Summary (tailored to the job)
   - Skills (emphasizing job-relevant technologies)
   - Professional Experience (prioritizing most relevant projects)
   - Education (make a reasonable assumption)

The tone should be professional and achievements-focused, directly addressing the job requirements.
    """;

      // Send request to your Firebase function
      final response = await http.post(
        Uri.parse('https://claude-proxy-56oomooeja-uc.a.run.app'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'model': 'claude-3-5-haiku-20241022',
          'max_tokens': 2000, // Increased for job description analysis
          'system': 'You are an expert resume writer and career consultant specializing in analyzing job descriptions and creating tailored resumes. You excel at identifying key requirements from job postings and highlighting the most relevant candidate experience to match those requirements.',
          'messages': [
            {
              'role': 'user',
              'content': prompt,
            }
          ],
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['content'][0]['text'];
      } else {
        throw Exception('Failed to generate resume: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error generating resume: $e');
    }
  }
}

// Example of how to integrate this with your existing GoRouter
// Add this to your GoRouter configuration:
/*
GoRoute(
  path: '/resume-generator',
  builder: (context, state) {
    // Get projects data from your state management solution or pass it as a parameter
    final List<dynamic> projects = _getProjects(); // Replace with your method
    return ResumeGenerator(projects: projects);
  },
),
*/
