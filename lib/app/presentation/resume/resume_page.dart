import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:portfolio_eriel/app/presentation/resume/resume_generator.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  final TextEditingController _promptController = TextEditingController();
  late List<dynamic> _projects;
  late List<dynamic> _filteredProjects;
  List<String> _allTechTags = [];
  List<String> _allIndustries = [];

  // Real projects data
  final String _jsonData = '''
{
  "projects": [
    {
      "id": "P8FXCl41nYa1Xd1TxsAq",
      "title": "Meta (Facebook)",
      "subtitle": "Software Engineer",
      "description": "Contributed to significant Daily User Growth (+250k DAU, +1M MAU). Built a robot map using 3D lidar scanner with ROS.",
      "techTags": ["Hack", "PHP", "GraphQL", "Python", "ROS (Robot OS)", "React", "Javascript", "CSS", "HTML", "Postgres", "3D Lidar", "Linux"],
      "projectOwner": "Meta Platforms",
      "startDate": "2020-06-12T00:00:00.000",
      "endDate": "2022-05-20T00:00:00.000",
      "industries": ["Social Media", "Robotics", "IoT"],
      "appLink": "https://facebook.com",
      "logoUrl": "https://firebasestorage.googleapis.com/v0/b/quasar-general.appspot.com/o/portfolio%2Fusers%2FEriel%20Jr%2FP8FXCl41nYa1Xd1TxsAq%2Flogos%2Ffacebook-logo-2019.png?alt=media&token=e183375a-6761-41cf-984e-b9f242e84edf"
    },
    {
      "id": "eJTPswAcJhpAIMvceaMW",
      "title": "Lowes Home Improvement",
      "subtitle": "Back End Engineer",
      "description": "Tech lead for a team focused on SEO for location pages of individual Lowe's stores across the US.",
      "techTags": ["Spring MVC", "Spring Data", "Spring Boot", "Postgres", "React", "Java", "Google Maps", "GCP"],
      "projectOwner": "Lowes Home Improvement",
      "startDate": "2019-05-01T00:00:00.000",
      "endDate": "2020-05-05T00:00:00.000",
      "industries": ["Home Improvement", "Ecomerce"],
      "appLink": "https://www.lowes.com",
      "logoUrl": "https://firebasestorage.googleapis.com/v0/b/quasar-general.appspot.com/o/portfolio%2Fusers%2FEriel%20Jr%2FeJTPswAcJhpAIMvceaMW%2Flogos%2Flowes-1.png?alt=media&token=0f90ad55-0102-4a36-81f5-4f4efd56e35e"
    },
    {
      "id": "zlcZgtVPA5lNzCAjLEJD",
      "title": "Slingshot Aerospace",
      "subtitle": "Full Stack Developer",
      "description": "Contributed to the development of a web app to map space, including satellites in orbit and debris. Implemented mathematical equations and UI representations of possible orbits.",
      "techTags": ["React", "Python", "Typescript", "Kotlin", "AWS", "Lambdas", "REST", "AWS Cognito", "Datadog", "Open Telemetry"],
      "projectOwner": "Slingshot Aerospace",
      "startDate": "2023-01-15T00:00:00.000",
      "endDate": "2023-07-01T00:00:00.000",
      "industries": ["Space Traffic", "Space Simulation", "Government"],
      "appLink": "https://www.slingshot.space/",
      "logoUrl": "https://firebasestorage.googleapis.com/v0/b/quasar-general.appspot.com/o/portfolio%2Fusers%2FEriel%20Jr%2FzlcZgtVPA5lNzCAjLEJD%2Flogos%2Fsling-1.png?alt=media&token=f6d78b5a-b0b4-47ca-bc90-748261bdcefa"
    },
    {
      "id": "a8x6Zte3HHpDmj6KeuND",
      "title": "Juke Audio",
      "subtitle": "Full Stack Mobile Developer",
      "description": "Refactored an existing PHP web app into a mobile application for Android and iOS using Flutter. Worked with RaspberryPi updating Django REST APIs.",
      "techTags": ["Flutter", "Firebase", "Python", "iOS", "Android", "Kotlin", "Java", "PHP", "Crashlitycs", "Mobile"],
      "projectOwner": "Juke Audio",
      "startDate": "2023-10-10T00:00:00.000",
      "endDate": "2024-12-01T00:00:00.000", 
      "industries": ["Home Entertainment", "IoT"],
      "appLink": "https://play.google.com/store/search?q=juke%20audio&c=apps",
      "logoUrl": "https://firebasestorage.googleapis.com/v0/b/quasar-general.appspot.com/o/portfolio%2Fusers%2FEriel%20Jr%2Fa8x6Zte3HHpDmj6KeuND%2Flogos%2Fjuke-1.jpeg?alt=media&token=1a21295c-bbf8-4636-9841-210dbbf90017"
    },
    {
      "id": "sxtqaJvH1ZcMUhbSi1O4",
      "title": "Check Inc",
      "subtitle": "Rails Developer",
      "description": "Created python scripts to autofill PDF files for tax purposes. Created a system to process client data and automatically fill out IRS tax forms.",
      "techTags": ["Ruby on Rails (RoR)", "Postgres", "GCP", "Adobe"],
      "projectOwner": "Check Inc",
      "startDate": "2023-03-13T00:00:00.000",
      "endDate": "2023-07-01T00:00:00.000",
      "industries": ["Fintech", "Tax Processing"],
      "appLink": "https://www.checkhq.com",
      "logoUrl": "https://firebasestorage.googleapis.com/v0/b/quasar-general.appspot.com/o/portfolio%2Fusers%2FEriel%20Jr%2Fnew%2Flogos%2Fcheck-1.jpeg?alt=media&token=7888221f-6d46-4cbe-b891-a9332fe71695"
    }
  ]
}
''';

  @override
  void initState() {
    super.initState();
    // Parse the projects data
    final Map<String, dynamic> jsonData = jsonDecode(_jsonData);
    _projects = jsonData['projects'];
    _filteredProjects = List.from(_projects);

    // Extract all unique tech tags
    final Set<String> techTags = {};
    for (var project in _projects) {
      if (project['techTags'] != null) {
        for (var tag in project['techTags']) {
          techTags.add(tag);
        }
      }
    }
    _allTechTags = techTags.toList()..sort();

    // Extract all unique industries
    final Set<String> industries = {};
    for (var project in _projects) {
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
        _filteredProjects = List.from(_projects);
      } else {
        query = query.toLowerCase();
        _filteredProjects = _projects.where((project) {
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
      body: ResumeGenerator(projects: _projects,),
      // body: Column(
      //   children: [
      //     // 1. Top section: Prompt input field
      //     Container(
      //       width: screenWidth,
      //       padding: const EdgeInsets.all(16.0),
      //       decoration: BoxDecoration(
      //         color: Colors.grey[200],
      //         boxShadow: [
      //           BoxShadow(
      //             color: Colors.black.withOpacity(0.1),
      //             blurRadius: 4.0,
      //             offset: const Offset(0, 2),
      //           )
      //         ],
      //       ),
      //       child: Row(
      //         children: [
      //           Expanded(
      //             child: TextField(
      //               controller: _promptController,
      //               decoration: InputDecoration(
      //                 hintText: 'Search by technology, industry, or keyword...',
      //                 border: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(8.0),
      //                 ),
      //                 filled: true,
      //                 fillColor: Colors.white,
      //                 prefixIcon: const Icon(Icons.search),
      //                 suffixIcon: _promptController.text.isNotEmpty
      //                     ? IconButton(
      //                         icon: const Icon(Icons.clear),
      //                         onPressed: () {
      //                           _promptController.clear();
      //                           _filterProjects('');
      //                         },
      //                       )
      //                     : null,
      //               ),
      //               onChanged: (value) {
      //                 _filterProjects(value);
      //               },
      //               maxLines: 1,
      //             ),
      //           ),
      //           const SizedBox(width: 12.0),
      //           ElevatedButton(
      //             onPressed: () {
      //               _filterProjects(_promptController.text);
      //             },
      //             style: ElevatedButton.styleFrom(
      //               padding: const EdgeInsets.symmetric(
      //                   horizontal: 24, vertical: 16),
      //               backgroundColor: Colors.blue[700],
      //             ),
      //             child: const Text(
      //               'Submit',
      //               style: TextStyle(color: Colors.white),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //
      //     // 2 & 3. Bottom split section
      //     Expanded(
      //       child: Row(
      //         crossAxisAlignment: CrossAxisAlignment.stretch,
      //         children: [
      //           // Left side: AI answer with Lorem Ipsum
      //           Expanded(
      //             child: Container(
      //               padding: const EdgeInsets.all(24.0),
      //               decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 border: Border(
      //                   right: BorderSide(color: Colors.grey[300]!, width: 1.0),
      //                 ),
      //               ),
      //               child: SingleChildScrollView(
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(_promptController.text.isEmpty
      //                         ? 'Portfolio Analysis'
      //                         : 'Search Results: ${_filteredProjects.length} Projects')
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //
      //           // Right side: JSON data view
      //           Expanded(
      //             child: Container(
      //               color: Colors.grey[900],
      //               padding: const EdgeInsets.all(24.0),
      //               child: SingleChildScrollView(
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     const Text(
      //                       'Projects Data',
      //                       style: TextStyle(
      //                         fontSize: 24,
      //                         fontWeight: FontWeight.bold,
      //                         color: Colors.white,
      //                       ),
      //                     ),
      //                     const SizedBox(height: 16),
      //                     Container(
      //                       padding: const EdgeInsets.all(16),
      //                       decoration: BoxDecoration(
      //                         color: Colors.grey[850],
      //                         borderRadius: BorderRadius.circular(8),
      //                       ),
      //                       child: _filteredProjects.isEmpty
      //                           ? const Center(
      //                               child: Text(
      //                                 'No projects match your search criteria',
      //                                 style: TextStyle(
      //                                   color: Colors.white70,
      //                                   fontSize: 16,
      //                                 ),
      //                               ),
      //                             )
      //                           : ListView.separated(
      //                               shrinkWrap: true,
      //                               // Add this line
      //                               physics:
      //                                   const NeverScrollableScrollPhysics(),
      //                               // Add this line
      //                               itemCount: _filteredProjects.length,
      //                               separatorBuilder: (context, index) =>
      //                                   const Divider(
      //                                 color: Colors.grey,
      //                                 height: 1,
      //                               ),
      //                               itemBuilder: (context, index) {
      //                                 final project = _filteredProjects[index];
      //                                 return ProjectCard(project: project);
      //                               },
      //                             ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
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
