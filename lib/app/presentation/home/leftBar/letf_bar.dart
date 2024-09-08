import 'package:flutter/material.dart';
import 'package:portfolio_eriel/app/presentation/home/leftBar/small_banding_banner.dart';
import 'package:portfolio_eriel/app/presentation/home/leftBar/time_period_selection.dart';
import 'package:portfolio_eriel/app/presentation/home/leftBar/vertical_tag_filtering.dart';
import 'package:portfolio_eriel/app/shared/spacers.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class LeftBarSection extends StatelessWidget {
  final List<Project> projects;
  final Developer? developer;
  final double width;

  const LeftBarSection({super.key, required this.projects, this.developer, this.width = 320});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 50,
      shadowColor: scheme.primary,
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
            padding: const EdgeInsets.only(bottom: 80 + 40),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  scheme.secondary.withOpacity(0.01),
                  Colors.white.withOpacity(0.2),
                  scheme.primary.withOpacity(0.2),
                  scheme.primary.withOpacity(0.4),
                  scheme.primary.withOpacity(0.6),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            width: width,
            height: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    child: Center(
                      child: SizedBox(
                        width: width * 0.6,
                        height: width * 0.6,
                        child: SmallBrandingBanner(developer: developer),
                      ),
                    ),
                  ),
                  const VSp8(),
                  Text(
                    developer?.name ?? "",
                    style:const  TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Color(0xff004E7B),shadows: [
                      Shadow(
                        offset: Offset(0.2, 0.2),
                        blurRadius: 1.0,
                        color: Color(0xff004E7B),
                      ),
                    ]),
                  ),
                  Text(
                    developer?.info ?? "",
                    style: TextStyle(
                        fontSize: 16,  fontStyle: FontStyle.italic, color: scheme.primary),
                  ),
                  const VSp24(),
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
            bottom: 30,
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
