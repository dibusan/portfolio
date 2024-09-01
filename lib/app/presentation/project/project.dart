import 'package:carousel_slider/carousel_slider.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/mini_info.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/project_logo.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/tech_tag_wrap.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/tech_tags.dart';
import 'package:portfolio_eriel/app/shared/__.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class ProjectPage extends StatelessWidget {
  final Project? project;

  const ProjectPage({super.key, this.project});

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Frame34Widget - FRAME - VERTICAL
    return SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: Card(
          color: const Color.fromARGB(1, 235, 239, 242),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const VSp24(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        BlocProvider.of<ProjectBloc>(context).add(const ProjectEventSelect(project: null));
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  // Logo -> Title -> Subtitles
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        ProjectLogo(imageUrl: project?.logoUrl),
                        const VSp8(),
                        ProjectMiniInfoSection(project: project, expand: true),
                      ],
                    ),
                  ),
                  const SizedBox(width: 200, child: Divider()),
                  // Tech Stack
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Center(
                          child: Text("Tech Stack"),
                        ),
                        const VSp8(),
                        TechTagsWrap(techTags: project?.techTags ?? []),
                      ],
                    ),
                  ),
                  const SizedBox(width: 200, child: Divider()),
                  // Images
                  if (project?.images != null)
                    LayoutBuilder(builder: (context, constrains) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: 300.0,
                            autoPlay: true,
                          ),
                          items: project?.images.map((i) {
                            final dec = BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(20),
                            );
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: constrains.maxWidth * 0.8,
                                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: dec,
                                  child: ImageOnCache(
                                    imageUrl: i,
                                    boxDecoration: dec,
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      );
                    }),
                  const SizedBox(width: 200, child: Divider()),
                  // Dates -> Client Info
                  buildDatesAndClientInfo(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget buildDatesAndClientInfo() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(),
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                                width: 313,
                                height: 16,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                                width: 45,
                                height: 45,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                )),
                            const SizedBox(width: 10),
                            Container(
                                width: 258,
                                height: 45,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                                width: 313,
                                height: 16,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLongDescription() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(),
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                                width: 313,
                                height: 16,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                          width: 313,
                          height: 116,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            color: Color.fromRGBO(255, 255, 255, 1),
                          )),
                      const SizedBox(height: 10),
                      Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                                width: 313,
                                height: 16,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                          width: 313,
                          height: 39,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            color: Color.fromRGBO(255, 255, 255, 1),
                          )),
                      const SizedBox(height: 10),
                      Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                                width: 313,
                                height: 16,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                          width: 313,
                          height: 39,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            color: Color.fromRGBO(255, 255, 255, 1),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImages() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    width: 313,
                    height: 16,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Color.fromRGBO(255, 255, 255, 1),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: const BoxDecoration(),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    width: 313,
                    height: 313,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Color.fromRGBO(255, 255, 255, 1),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
