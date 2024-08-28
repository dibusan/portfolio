import 'package:flutter/material.dart';
import 'package:portfolio_eriel/app/presentation/home/filters/small_banding_banner.dart';
import 'package:portfolio_eriel/app/presentation/home/filters/time_period_selection.dart';
import 'package:portfolio_eriel/app/presentation/home/filters/vertical_tag_filtering.dart';
import 'package:portfolio_eriel/app/shared/__.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class FilteringSection extends StatelessWidget {
  const FilteringSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Rectangle263Widget - RECTANGLE
    return Card(
      color: Colors.white,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: const Column(
          children: [
            SmallBrandingBanner(),
            VSp24(),
            VerticalTagFiltering(),
            VSp24(),
            TimePeriodSelection(),
          ],
        ),
      ),
    );
  }
}

Widget buildTechTags({List<String>? techTags, Function(String)? onTab, Function(String)? onRemove}) {
  List<Widget> tags = (techTags ?? Project.allTechTags())
      .map(
        (e) => TechTag(
          name: e,
          onTap: onTab == null ? null : () => onTab.call(e),
          onRemoved: onRemove == null ? null : () => onRemove.call(e),
        ),
      )
      .toList();
  return Wrap(
    alignment: WrapAlignment.start,
    spacing: 8.0, // gap between adjacent chips
    runSpacing: 4.0, // gap between lines
    children: tags,
  );
}
