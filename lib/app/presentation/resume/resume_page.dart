import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';

import 'package:portfolio_eriel/app/presentation/resume/resume_generator.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

import '../../bloc/project/project_bloc.dart';

class ResumePage extends StatefulWidget {
  ResumePage({Key? key}) : super(key: key);

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  final TextEditingController _promptController = TextEditingController();

  List<Project> _projects = [];

  late List<dynamic> _filteredProjects;
  List<String> _allTechTags = [];
  List<String> _allIndustries = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      _allTechTags = extractTechTags(_projects);
      _allIndustries = extractIndustries(_projects);
    });
  }

  List<String> extractTechTags(List<Project> projects) {
    // Extract all unique tech tags
    final Set<String> techTags = {};
    for (var project in projects) {
      for (var tag in project.techTags) {
        techTags.add(tag);
      }
    }
    return techTags.toList()..sort();
  }

  List<String> extractIndustries(List<Project> projects) {
    // Extract all unique industries
    final Set<String> industries = {};
    for (var project in projects) {
      for (var industry in project.industries) {
        industries.add(industry);
      }
    }
    return industries.toList()..sort();
  }

  void _filterProjects(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredProjects = List.from(_projects);
      } else {
        query = query.toLowerCase();
        _filteredProjects = _projects.where((project) {
          final title = project.title.toLowerCase() ?? '';
          final description = project.description?.toLowerCase() ?? '';
          final subtitle = project.subtitle?.toLowerCase() ?? '';
          final projectOwner = project.projectOwner?.toLowerCase() ?? '';
          final techTags = project.techTags;
          final industries = project.industries;

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

    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        _projects = state.projects;
        _allTechTags = extractTechTags(_projects);
        _allIndustries = extractIndustries(_projects);

        return Scaffold(
          body: ResumeGenerator(
            projects: _projects,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;

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
              if (project.logoUrl != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    project.logoUrl ?? '',
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
                      project.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    if (project.subtitle != null)
                      Text(
                        project.subtitle!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[400],
                        ),
                      ),
                  ],
                ),
              ),
              if (project.appLink != null)
                IconButton(
                  icon: const Icon(Icons.link, color: Colors.blue),
                  onPressed: () {
                    // Would launch URL in browser
                  },
                ),
            ],
          ),
          const SizedBox(height: 12),
          if (project.description != null)
            Text(
              _stripHtmlTags(project.description!),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                height: 1.4,
                color: Colors.grey[300],
              ),
            ),
          const SizedBox(height: 8),
          if (project.techTags.isNotEmpty)
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: project.techTags
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

