import 'package:flutter/cupertino.dart';
import 'package:portfolio_eriel/app/shared/__.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class ProjectMiniInfoSection extends StatelessWidget {
  final Project? project;
  final bool expand;

  const ProjectMiniInfoSection({super.key, this.project, this.expand = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project?.title ?? "",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            project?.subtitle ?? "",
            maxLines: expand ? null : 1,
            overflow: expand ? null : TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14),
          ),
          const VSp8(),
          Text(
            project?.description ?? "",
            overflow: expand ? null : TextOverflow.ellipsis,
            maxLines: expand ? null : 2,
          ),
        ],
      ),
    );
  }
}
