import 'package:flutter/material.dart';
import 'package:portfolio_eriel/app/presentation/home/filters/small_banding_banner.dart';
import 'package:portfolio_eriel/app/presentation/home/filters/time_period_selection.dart';
import 'package:portfolio_eriel/app/presentation/home/filters/vertical_tag_filtering.dart';
import 'package:portfolio_eriel/app/shared/spacers.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class FilteringSection extends StatelessWidget {
  final List<Project> projects;

  const FilteringSection({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
      shadowColor: Colors.blue,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.5),
              Colors.lightBlue.shade50,
              Colors.lightBlue.shade100,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        width: 320,
        height: double.maxFinite,
        padding: const EdgeInsets.only(top: 160, right: 30, left: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                child: Center(
                  child: SizedBox(
                    width: 320 * 0.6,
                    height: 320 * 0.6,
                    child: SmallBrandingBanner(),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              VerticalTagFiltering(projects: projects),
              const VSp24(),
              const TimePeriodSelection(),
            ],
          ),
        ),
      ),
    );
  }
}
