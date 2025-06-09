import 'package:flutter/material.dart';

class JobDescriptionInput extends StatelessWidget {
  final String jobDescription;
  final Function(String) onChanged;

  const JobDescriptionInput({
    super.key,
    required this.jobDescription,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 20),
          Expanded(child: _buildTextInput()),
          const SizedBox(height: 16),
          _buildCharacterCount(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.description, color: Theme.of(context).primaryColor),
        const SizedBox(width: 8),
        const Text(
          'Paste job description',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildTextInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Paste the complete job description here...\n\n'
              'The AI will analyze it to:\n'
              '• Identify key technologies and skills\n'
              '• Match your experience to requirements\n'
              '• Highlight relevant achievements',
          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(20),
        ),
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }

  Widget _buildCharacterCount() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.text_fields, size: 20, color: Colors.green.shade700),
          const SizedBox(width: 8),
          Text(
            '${jobDescription.length} characters',
            style: TextStyle(
              color: Colors.green.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
