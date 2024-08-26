import 'package:flutter/material.dart';
import 'package:portfolio_eriel/src/widgets/small_banding_banner.dart';
import 'package:portfolio_eriel/src/widgets/spacers.dart';
import 'package:portfolio_eriel/src/widgets/time_period_selection.dart';
import 'package:portfolio_eriel/src/widgets/vertical_tag_filtering.dart';

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
            Text("Filter by tech"),
            VSp8(),
            VerticalTagFiltering(),
            VSp24(),
            SizedBox(width: 200, child: Divider(),),
            VSp10(),
            Text("Time period selection"),
            VSp8(),
            TimePeriodSelection(),
          ],
        ),
      ),
    );
  }
}
