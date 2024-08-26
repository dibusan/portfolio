import 'package:flutter/material.dart';
import 'package:portfolio_eriel/src/widgets/project_logo.dart';
import 'package:portfolio_eriel/src/widgets/project_title_section.dart';
import 'package:portfolio_eriel/src/widgets/spacers.dart';
import 'package:portfolio_eriel/src/widgets/tech_tag.dart';

class ProjectPreviewCard extends StatelessWidget {
  const ProjectPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(89, 148, 227, 0.1),
              offset: Offset(0, 2),
              blurRadius: 10,
            ),
          ],
        ),
        // --- Top Level Card
        child: Card(
          margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
          clipBehavior: Clip.hardEdge,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              debugPrint('Card tapped.');
            },
            // --- First Level Column
            child:  Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProjectLogo(),
                      HSp8(),
                      ProjectTitleSection(),
                    ],
                  ),
                  const VSp8(),
                  buildTagRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Widget buildTagRow() {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TechTag(),
        HSp8(),
        TechTag(),
        HSp8(),
        TechTag(),
        HSp8(),
        TechTag(),
      ],
    );
  }


}
