import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeneratedResumeViewer extends StatelessWidget {
  final String? resume;
  final VoidCallback onCopy;
  final VoidCallback onDownload;

  const GeneratedResumeViewer({
    super.key,
    this.resume,
    required this.onCopy,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey.shade50,
            Colors.blue.shade50,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          Expanded(child: _buildResumeContent()),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.article, color: Theme.of(context).primaryColor, size: 28),
          const Text(
            'Generated Resume',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          _ActionButton(
            icon: Icons.copy,
            tooltip: 'Copy to clipboard',
            backgroundColor: Colors.blue.shade50,
            onPressed: onCopy,
          ),
          const SizedBox(width: 8),
          _ActionButton(
            icon: Icons.download,
            tooltip: 'Download as Markdown',
            backgroundColor: Colors.green.shade50,
            onPressed: onDownload,
          ),
        ],
      ),
    );
  }

  Widget _buildResumeContent() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: SelectableText(
          resume ?? '',
          style: const TextStyle(
            fontSize: 15,
            height: 1.6,
            fontFamily: 'monospace',
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.tooltip,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      tooltip: tooltip,
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
    );
  }
}
