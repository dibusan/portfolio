import 'package:flutter/material.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class JobSelector extends StatefulWidget {
  final List<Project> jobs;
  final List<Project> selectedJobs;
  final Function(Project job) onTagToggled;

  const JobSelector({
    super.key,
    required this.jobs,
    required this.selectedJobs,
    required this.onTagToggled,
  });

  @override
  State<JobSelector> createState() => _JobSelectorState();
}

class _JobSelectorState extends State<JobSelector> {
  bool _isExpanded = false;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredJobs = widget.jobs
        .where((job) =>
            job.title.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white, width: 1)),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          dense: true,
          title: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.work, color: Theme.of(context).primaryColor),
                      const SizedBox(width: 8),
                      Text(
                        'Select Jobs (${widget.selectedJobs.length})',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                if (_isExpanded)
                  Expanded(
                    flex: 2,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        isDense: false,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          trailing: Icon(
            _isExpanded ? Icons.expand_less : Icons.expand_more,
          ),
          onExpansionChanged: (expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: filteredJobs.length,
                itemBuilder: (context, index) {
                  final job = filteredJobs[index];
                  final isSelected = widget.selectedJobs.contains(job);
                  return ListTile(
                    tileColor: Colors.white.withOpacity(0.05),
                    onTap: () => widget.onTagToggled(job),
                    leading: Checkbox(
                      value: isSelected,
                      onChanged: (_) => widget.onTagToggled(job),
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                    ),
                    title: Text(job.title),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
