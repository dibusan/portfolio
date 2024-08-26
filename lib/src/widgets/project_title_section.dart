import 'package:flutter/cupertino.dart';
import 'package:portfolio_eriel/src/widgets/spacers.dart';

class ProjectTitleSection extends StatelessWidget {
  const ProjectTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return buildTextColumn();
  }

  Widget buildTextColumn() {
    return Column(
      children: [
        buildTitle(),
        const VSp10(),
        buildSubtitle(),
        const VSp8(),
        buildSubtitle(),
      ],
    );
  }

  Widget buildSubtitle() {
    return Container(
      width: 221,
      height: 16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(235, 239, 242, 1),
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      width: 221,
      height: 33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromRGBO(235, 239, 242, 1),
      ),
    );
  }

}