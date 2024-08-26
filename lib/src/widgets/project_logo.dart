import 'package:flutter/cupertino.dart';

class ProjectLogo extends StatelessWidget {
  const ProjectLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      height: 84,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(235, 239, 242, 1),
      ),
    );
  }

}