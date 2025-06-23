import 'package:flutter/material.dart';

class TechStackSelector extends StatefulWidget {
  final Map<String, List<String>> techCategories;
  final Set<String> selectedTags;
  final Function(String) onTagToggled;
  final VoidCallback onClearAll;

  const TechStackSelector({
    super.key,
    required this.techCategories,
    required this.selectedTags,
    required this.onTagToggled,
    required this.onClearAll,
  });

  @override
  State<TechStackSelector> createState() => _TechStackSelectorState();
}

class _TechStackSelectorState extends State<TechStackSelector> {
  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 20),
          Expanded(child: _buildCategoriesGrid()),
          const SizedBox(height: 16),
          _buildSelectionInfo(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.code, color: Theme.of(context).primaryColor),
              const SizedBox(width: 8),
              Text(
                'Select technologies${widget.selectedTags.isEmpty ? '' : ' (${widget.selectedTags.length})'}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search technologies...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: widget.selectedTags.isEmpty
                  ? null
                  : TextButton(
                      onPressed: widget.onClearAll,
                      child: const Text('Clear all'),
                    ),
            ),
            onChanged: (value) {
              _searchQuery = value.toLowerCase();
              (context as Element).markNeedsBuild();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesGrid() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.techCategories.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: _TechCategorySection(
              category: entry.key,
              tags: entry.value
                  .where((tag) => tag.toLowerCase().contains(_searchQuery))
                  .toList(),
              selectedTags: widget.selectedTags,
              onTagToggled: widget.onTagToggled,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSelectionInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 20, color: Colors.blue.shade700),
          const SizedBox(width: 8),
          Text(
            '${widget.selectedTags.length} technologies selected',
            style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _TechCategorySection extends StatelessWidget {
  final String category;
  final List<String> tags;
  final Set<String> selectedTags;
  final Function(String) onTagToggled;

  const _TechCategorySection({
    required this.category,
    required this.tags,
    required this.selectedTags,
    required this.onTagToggled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: tags
              .map((tag) => _TechChip(
                    tag: tag,
                    isSelected: selectedTags.contains(tag),
                    onTap: () => onTagToggled(tag),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _TechChip extends StatelessWidget {
  final String tag;
  final bool isSelected;
  final VoidCallback onTap;

  const _TechChip({
    required this.tag,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: FilterChip(
        label: Text(
          tag,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade700,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
        selected: isSelected,
        onSelected: (_) => onTap(),
        backgroundColor: Colors.grey.shade200,
        selectedColor: Theme.of(context).primaryColor,
        checkmarkColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Colors.transparent,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
