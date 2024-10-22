import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_eriel/app/shared/cache_image.dart';

class ProjectLogo extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback? onEdit;

  const ProjectLogo({super.key, this.imageUrl, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageOnCache(
          imageUrl: imageUrl ?? "",
          size: const Size(84, 84),
          fit: BoxFit.cover,
          boxDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(235, 239, 242, 1),
          ),
        ),
        if (onEdit != null)
          Positioned(
            right: 0,
            bottom: 0,
            child: CircleAvatar(
              radius: 16,
              child: IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue, size: 16)  ,
                onPressed: onEdit,
              ),
            ),
          ),
      ],
    );
  }
}
