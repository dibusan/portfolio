import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/presentation/project/dialog/project_dialog.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/tech_tags.dart';
import 'package:portfolio_eriel/app/shared/__.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';
import 'package:super_banners/super_banners.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyClipper extends CustomClipper<Path> {
  final double radius;

  MyClipper({required this.radius});

  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width - radius * 2, 0);
    path.quadraticBezierTo(size.width - radius - 10, -10, size.width - radius - 10, radius / 2);
    path.quadraticBezierTo(size.width - radius - 6, radius + 6, size.width - radius / 2, radius + 10);
    path.quadraticBezierTo(size.width + 10, radius + 10, size.width, radius * 2);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class ProjectPreviewCard extends StatelessWidget {
  final Project project;
  final bool showPersonal;

  const ProjectPreviewCard({super.key, required this.project, this.showPersonal = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        bool isSelected = state.selected?.id == project.id;
        return InkWell(
          onTap: () => ProjectDialog.show(context, project: project),
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              ClipPath(
                clipper: MyClipper(radius: 70),
                child: GlassContainer.clearGlass(
                  borderColor: Colors.transparent,
                  color: Colors.white.withOpacity(isSelected ? 0.8 : 0.3),
                  elevation: 20,
                  width: 600,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          // dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            project.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                project.subtitle ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
                              ),
                              Container(
                                constraints: const BoxConstraints(minHeight: 40),
                                padding: const EdgeInsets.only(right: 40),
                                child: Text(project.descriptionFirstLine, maxLines: 2),
                              )
                            ],
                          ),
                          isThreeLine: true,
                        ),
                        const SizedBox(height: 5),
                        Flexible(
                          child: Stack(
                            children: [
                              project.images.isEmpty
                                  ? const SizedBox()
                                  : ImageOnCache(
                                      key: Key(project.images.first),
                                      imageUrl: project.images.first,
                                      fit: BoxFit.cover,
                                      boxDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                              if (project.startDate != null || project.endDate != null)
                                Positioned(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                    ),
                                    child: Text(
                                      "${project.formatStartDate(format: "MMM yyyy")}  -  ${project.formatEndDate(format: "MMM yyyy")}",
                                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              if (showPersonal)
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                    ),
                                    child: Text(
                                      project.isPersonal ? "Personal" : "Work",
                                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          height: 50,
                          child: ScrollConfiguration(
                            behavior: MyCustomScrollBehavior(),
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder: (_, i) => const SizedBox(width: 4),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, i) => TechTag(
                                name: project.techTags[i],
                                borderColor: Colors.black87,
                                textColor: Colors.black87,
                              ),
                              itemCount: project.techTags.length,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white.withOpacity(isSelected ? 0.7 : 0.3),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white.withOpacity(isSelected ? 0.7 : 0.3),
                    backgroundImage: project.logoUrl == null ? null : NetworkImage(project.logoUrl!),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
