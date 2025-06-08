import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:portfolio_eriel/app/presentation/resume/resume_generator.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({Key? key, required List<Project> this.projects}) : super(key: key);

  final List<dynamic> projects;

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  final TextEditingController _promptController = TextEditingController();

  late List<dynamic> _filteredProjects;
  List<String> _allTechTags = [];
  List<String> _allIndustries = [];

  @override
  void initState() {
    super.initState();

    // Extract all unique tech tags
    final Set<String> techTags = {};
    for (var project in widget.projects) {
      if (project['techTags'] != null) {
        for (var tag in project['techTags']) {
          techTags.add(tag);
        }
      }
    }
    _allTechTags = techTags.toList()..sort();

    // Extract all unique industries
    final Set<String> industries = {};
    for (var project in widget.projects) {
      if (project['industries'] != null) {
        for (var industry in project['industries']) {
          industries.add(industry);
        }
      }
    }
    _allIndustries = industries.toList()..sort();
  }

  void _filterProjects(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredProjects = List.from(widget.projects);
      } else {
        query = query.toLowerCase();
        _filteredProjects = widget.projects.where((project) {
          final title = project['title']?.toLowerCase() ?? '';
          final description = project['description']?.toLowerCase() ?? '';
          final subtitle = project['subtitle']?.toLowerCase() ?? '';
          final projectOwner = project['projectOwner']?.toLowerCase() ?? '';
          final techTags = project['techTags'] ?? [];
          final industries = project['industries'] ?? [];

          // Check if query matches any of the project fields
          final titleMatch = title.contains(query);
          final descriptionMatch = description.contains(query);
          final subtitleMatch = subtitle.contains(query);
          final ownerMatch = projectOwner.contains(query);

          // Check if query matches any tech tag
          final techTagMatch =
              techTags.any((tag) => tag.toLowerCase().contains(query));

          // Check if query matches any industry
          final industryMatch = industries
              .any((industry) => industry.toLowerCase().contains(query));

          return titleMatch ||
              descriptionMatch ||
              subtitleMatch ||
              ownerMatch ||
              techTagMatch ||
              industryMatch;
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ResumeGenerator(projects: widget.projects,),
    );
  }

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }
}

class ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (project['logoUrl'] != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    project['logoUrl'],
                    width: 48,
                    height: 48,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 48,
                        height: 48,
                        color: Colors.grey[800],
                        child: const Icon(Icons.business, color: Colors.white),
                      );
                    },
                  ),
                ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project['title'] ?? 'Untitled Project',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    if (project['subtitle'] != null)
                      Text(
                        project['subtitle'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[400],
                        ),
                      ),
                  ],
                ),
              ),
              if (project['appLink'] != null)
                IconButton(
                  icon: const Icon(Icons.link, color: Colors.blue),
                  onPressed: () {
                    // Would launch URL in browser
                  },
                ),
            ],
          ),
          const SizedBox(height: 12),
          if (project['description'] != null)
            Text(
              _stripHtmlTags(project['description']),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                height: 1.4,
                color: Colors.grey[300],
              ),
            ),
          const SizedBox(height: 8),
          if (project['techTags'] != null &&
              (project['techTags'] as List).isNotEmpty)
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: (project['techTags'] as List)
                  .take(5)
                  .map((tag) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                      ))
                  .toList(),
            ),
        ],
      ),
    );
  }

  String _stripHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }
}

// Usage in main.dart
/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Showcase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PortfolioLayout(),
    );
  }
}
*/
