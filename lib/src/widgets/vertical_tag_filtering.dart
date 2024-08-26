import 'package:flutter/material.dart';
import 'package:portfolio_eriel/src/widgets/tech_tag.dart';

class VerticalTagFiltering extends StatelessWidget {
  const VerticalTagFiltering({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSearchBar(),
        Container(width: 100, child: Divider(),),
        buildSelectedTechTags(),
        Container(width: 100, child: Divider(),),
        buildTechTags(),
      ],
    );
  }

  Widget buildSearchBar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 228,
        height: 24,
        color: Colors.grey,
      ),
    );
  }

  Widget buildSelectedTechTags() {
    List<Widget> tags = [];
    for (int i = 0; i < 5; i++) {
      tags.add(Center(child: TechTag(isRemovable: true,)));
    }

    return Container(
      height: 50,
      width: 228,
      child: GridView.count(
        crossAxisCount: 4,
        children: tags,
        childAspectRatio: 2,
      ),
    );
  }

  Widget buildTechTags() {
    List<Widget> tags = [];
    for (int i = 0; i < 100; i++) {
      tags.add(Center(child: TechTag()));
    }

    return Container(
      height: 300,
      width: 228,
      child: GridView.count(
        crossAxisCount: 3,
        children: tags,
        childAspectRatio: 2.5,
      ),
    );
  }
}
