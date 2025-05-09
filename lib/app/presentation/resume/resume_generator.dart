// UI Widget for generating resumes
import 'package:flutter/material.dart';

import '../../../data/service/claude/claude_service.dart';

class ResumeGenerator extends StatefulWidget {
  final List<dynamic> projects;

  const ResumeGenerator({Key? key, required this.projects}) : super(key: key);

  @override
  State<ResumeGenerator> createState() => _ResumeGeneratorState();
}

class _ResumeGeneratorState extends State<ResumeGenerator> {
  final TextEditingController _additionalContextController =
  TextEditingController();
  String? _generatedResume;
  bool _isLoading = false;
  List<String> _allTechTags = [];
  Set<String> _selectedTechTags = {};

  @override
  void initState() {
    super.initState();
    _extractTechTags();
  }

  void _extractTechTags() {
    final Set<String> techTags = {};
    for (var project in widget.projects) {
      if (project['techTags'] != null) {
        for (var tag in project['techTags']) {
          techTags.add(tag.toString());
        }
      }
    }
    _allTechTags = techTags.toList()..sort();
  }

  Future<void> _generateResume() async {

    if (_selectedTechTags.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one technology')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _generatedResume = null;
    });

    try {
      final claudeService = ClaudeService();
      final resume = await claudeService.generateResumeContent(
        projects: widget.projects,
        focusedTechStack: _selectedTechTags.toList(),
        additionalContext: _additionalContextController.text.isNotEmpty
            ? _additionalContextController.text
            : null,
      );

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Resume Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Select Technologies to Focus On:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
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
            const SizedBox(height: 16),
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
            Center(
              child: ElevatedButton(
                onPressed: _isLoading ? null : _generateResume,
                child: _isLoading
                    ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
                    : const Text('Generate Resume'),
              ),
            ),
            const SizedBox(height: 24),
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
                    border: Border.all(color: Colors.grey),
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
    super.dispose();
  }
}
