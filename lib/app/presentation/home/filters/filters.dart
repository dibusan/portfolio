import 'package:flutter/material.dart';
import 'package:portfolio_eriel/app/presentation/home/filters/small_banding_banner.dart';
import 'package:portfolio_eriel/app/presentation/home/filters/time_period_selection.dart';
import 'package:portfolio_eriel/app/presentation/home/filters/vertical_tag_filtering.dart';
import 'package:portfolio_eriel/app/shared/spacers.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class FilteringSection extends StatelessWidget {
  final List<Project> projects;
  final double width;

  const FilteringSection({super.key, required this.projects, this.width = 320});

  @override
  Widget build(BuildContext context) {
    final developer = Developer.eriel();
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
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 80),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.lightBlue.shade50.withOpacity(0.7),
                  Colors.lightBlue.shade100.withOpacity(0.8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            width: 320,
            height: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    child: const Center(
                      child: SizedBox(
                        width: 320 * 0.6,
                        height: 320 * 0.6,
                        child: SmallBrandingBanner(),
                      ),
                    ),
                  ),
                  const VSp8(),
                  Text(
                    developer.name ?? "",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: VerticalTagFiltering(projects: projects),
                  ),
                  const VSp24(),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TimePeriodSelection(),
            ),
          )
        ],
      ),
    );
  }
}
