import 'package:flutter/cupertino.dart';
import 'package:portfolio_eriel/app/shared/cache_image.dart';

class ProjectLogo extends StatelessWidget {
  final String? imageUrl;

  const ProjectLogo({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ImageOnCache(
      imageUrl: imageUrl ?? "",
      size: const Size(84, 84),
      boxDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(235, 239, 242, 1),
      ),
    );
  }
}
