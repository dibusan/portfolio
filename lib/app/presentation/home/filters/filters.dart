import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/presentation/home/filters/small_banding_banner.dart';
import 'package:portfolio_eriel/app/presentation/home/filters/time_period_selection.dart';
import 'package:portfolio_eriel/app/presentation/home/filters/vertical_tag_filtering.dart';
import 'package:portfolio_eriel/app/shared/__.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class FilteringSection extends StatelessWidget {
  final List<Project> projects;

  const FilteringSection({super.key, required this.projects});

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
        child: Column(
          children: [
            const SmallBrandingBanner(),
            const VSp24(),
            VerticalTagFiltering(projects: projects),
            const VSp24(),
            const TimePeriodSelection(),
          ],
        ),
      ),
    );
  }
}
