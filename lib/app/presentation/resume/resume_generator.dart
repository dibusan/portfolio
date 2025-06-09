// UI Widget for generating resumes with tabbed input selection
import 'package:flutter/material.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

import '../../../data/service/claude/claude_service.dart';

class ResumeGenerator extends StatefulWidget {
  final List<Project> projects;

  const ResumeGenerator({super.key, required this.projects});

  @override
  State<ResumeGenerator> createState() => _ResumeGeneratorState();
}

class _ResumeGeneratorState extends State<ResumeGenerator>
    with SingleTickerProviderStateMixin {
  final TextEditingController _additionalContextController =
      TextEditingController();
  final TextEditingController _jobDescriptionController =
      TextEditingController();

  String? _generatedResume;
  bool _isLoading = false;
  List<String> _allTechTags = [];
  Set<String> _selectedTechTags = {};

  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
    _extractTechTags();
  }

  void _extractTechTags() {
    final Set<String> techTags = {};
    for (Project project in widget.projects) {
      for (var tag in project.techTags) {
        techTags.add(tag.toString());
      }
    }
    _allTechTags = techTags.toList()..sort();
  }

  bool _canGenerateResume() {
    if (_currentTabIndex == 0) {
      // Tech stack selection tab
      return _selectedTechTags.isNotEmpty;
    } else {
      // Job description tab
      return _jobDescriptionController.text.trim().isNotEmpty;
    }
  }

  String _getValidationMessage() {
    if (_currentTabIndex == 0) {
      return 'Please select at least one technology';
    } else {
      return 'Please enter a job description';
    }
  }

  Future<void> _generateResume() async {
    if (!_canGenerateResume()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_getValidationMessage())),
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _generatedResume = null;
    });

    try {
      final claudeService = ClaudeService();
      String resume;

      if (_currentTabIndex == 0) {
        // Use selected tech stacks
        resume = await claudeService.generateResumeContent(
          projects: widget.projects,
          focusedTechStack: _selectedTechTags.toList(),
          additionalContext: _additionalContextController.text.isNotEmpty
              ? _additionalContextController.text
              : null,
        );
      } else {
        // Use job description to identify tech focus
        resume = await claudeService.generateResumeFromJobDescription(
          projects: widget.projects,
          jobDescription: _jobDescriptionController.text.trim(),
          additionalContext: _additionalContextController.text.isNotEmpty
              ? _additionalContextController.text
              : null,
        );
      }

      setState(() {
        _generatedResume = resume;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  Widget _buildTechStackTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Technologies to Focus On:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 12),
        Container(
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: _allTechTags.map((tag) {
                  final isSelected = _selectedTechTags.contains(tag);
                  return FilterChip(
                    label: Text(tag),
                    selected: isSelected,
                    selectedColor: Colors.blue.shade100,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedTechTags.add(tag);
                        } else {
                          _selectedTechTags.remove(tag);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Selected: ${_selectedTechTags.length} technologies',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _buildJobDescriptionTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Paste Job Description:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 12),
        Container(
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _jobDescriptionController,
            decoration: const InputDecoration(
              hintText:
                  'Paste the job description here. AI will analyze it to identify the most relevant technologies and skills to highlight in your resume...',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
            maxLines: null,
            expands: true,
            textAlignVertical: TextAlignVertical.top,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Characters: ${_jobDescriptionController.text.length}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Resume Generator'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.list),
              text: 'Select Tech Stack',
            ),
            Tab(
              icon: Icon(Icons.description),
              text: 'Job Description',
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tab Content
            SizedBox(
              height: 320,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTechStackTab(),
                  _buildJobDescriptionTab(),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Additional Context (shared between tabs)
            TextField(
              controller: _additionalContextController,
              decoration: const InputDecoration(
                labelText: 'Additional Context (Optional)',
                border: OutlineInputBorder(),
                hintText: 'Add any other details you want in your resume...',
              ),
              maxLines: 3,
            ),

            const SizedBox(height: 16),

            // Generate Button
            Center(
              child: ElevatedButton(
                onPressed: _isLoading ? null : _generateResume,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(_currentTabIndex == 0
                        ? 'Generate Resume from Tech Stack'
                        : 'Generate Resume from Job Description'),
              ),
            ),

            const SizedBox(height: 24),

            // Generated Resume Display
            if (_generatedResume != null) ...[
              const Text(
                'Generated Resume:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SingleChildScrollView(
                    child: SelectableText(_generatedResume!),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.copy),
                    label: const Text('Copy'),
                    onPressed: () {
                      // Implement copy to clipboard
                    },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.download),
                    label: const Text('Download PDF'),
                    onPressed: () {
                      // Implement PDF download
                    },
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _additionalContextController.dispose();
    _jobDescriptionController.dispose();
    _tabController.dispose();
    super.dispose();
  }
}
