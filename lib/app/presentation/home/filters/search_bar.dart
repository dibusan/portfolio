import 'package:flutter/material.dart';

class FilterSearchBar extends StatelessWidget {
  final TextEditingController filterTagController;

  const FilterSearchBar({super.key, required this.filterTagController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: filterTagController,
      decoration: InputDecoration(
        suffixIcon: filterTagController.text.isEmpty
            ? null
            : IconButton(onPressed: () => filterTagController.clear(), icon: const Icon(Icons.close)),
        hintText: "Type to filter tags",
        hintStyle: TextStyle(color: Colors.grey.shade400),
      ),
    );
  }
}
