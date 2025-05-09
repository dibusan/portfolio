import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Service for interacting with Claude API
class ClaudeService {
  Future<String> generateResumeContent({
    required List<dynamic> projects,
    required List<String> focusedTechStack,
    String? additionalContext,
  }) async {
    try {
      // Build the prompt
      final prompt = "Create a professional resume focused on $focusedTechStack...";

      // Call your Firebase function instead of Anthropic API directly
      final response = await http.post(
        // Uri.parse('https://us-central1-YOUR_PROJECT_ID.cloudfunctions.net/claude_proxy'),
        Uri.parse('https://claude-proxy-56oomooeja-uc.a.run.app'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'model': 'claude-3-5-haiku-20241022',
          // 'model': 'claude-3-opus-20240229',
          'max_tokens': 1500,
          'messages': [{'role': 'user', 'content': prompt}]
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
