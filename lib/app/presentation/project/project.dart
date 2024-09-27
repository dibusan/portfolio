import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/project_logo.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/tech_tag_wrap.dart';
import 'package:portfolio_eriel/app/shared/__.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class ProjectPage extends StatelessWidget {
  final Project? project;
  final Function()? onCloseTab;
  final BorderRadius? borderRadius;

  const ProjectPage({super.key, this.project, this.onCloseTab, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: GlassContainer.clearGlass(
            borderColor: Colors.white,
            elevation: 50,
            borderRadius: borderRadius ?? const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            color: Colors.white.withOpacity(0.3),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const VSp10(),
                Align(
                  alignment: onCloseTab == null ? Alignment.topLeft : Alignment.topRight,
                  child: Container(
                    decoration:  BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: onCloseTab ??
                          () {
                            BlocProvider.of<ProjectBloc>(context).add(const ProjectEventSelect(project: null));
                          },
                      icon: const Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Logo -> Title -> Subtitles
                        Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(width: double.maxFinite),
                              ProjectLogo(imageUrl: project?.logoUrl),
                              const VSp8(),
                              Text(project?.title ?? "", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                              Text(
                                project?.subtitle ?? "",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const VSp8(),
                              Text(
                                project?.description ?? "",
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        const VSp10(),
                        const Text(
                          "Tech Stack",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const VSp8(),
                        TechTagsWrap(
                          techTags: project?.techTags ?? [],
                          backgroundColor: Colors.white,
                        ),
                        const VSp10(),
                        const Text(
                          "Media example",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const VSp8(),
                        // Images
                        if (project?.images != null)
                          LayoutBuilder(builder: (context, constrains) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
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
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            );
                          }),
                        // Dates -> Client Info
                        // buildDatesAndClientInfo(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
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
                      // Container(
                      //   decoration: const BoxDecoration(),
                      //   padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: <Widget>[
                      //       Container(
                      //           width: 45,
                      //           height: 45,
                      //           decoration: const BoxDecoration(
                      //             borderRadius: BorderRadius.only(
                      //               topLeft: Radius.circular(5),
                      //               topRight: Radius.circular(5),
                      //               bottomLeft: Radius.circular(5),
                      //               bottomRight: Radius.circular(5),
                      //             ),
                      //             color: Color.fromRGBO(255, 255, 255, 1),
                      //           )),
                      //       const SizedBox(width: 10),
                      //       Container(
                      //           width: 258,
                      //           height: 45,
                      //           decoration: const BoxDecoration(
                      //             borderRadius: BorderRadius.only(
                      //               topLeft: Radius.circular(5),
                      //               topRight: Radius.circular(5),
                      //               bottomLeft: Radius.circular(5),
                      //               bottomRight: Radius.circular(5),
                      //             ),
                      //             color: Color.fromRGBO(255, 255, 255, 1),
                      //           )),
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(height: 10),
                      // Container(
                      //   decoration: const BoxDecoration(),
                      //   padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      //   child: Column(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: <Widget>[
                      //       Container(
                      //           width: 313,
                      //           height: 16,
                      //           decoration: const BoxDecoration(
                      //             borderRadius: BorderRadius.only(
                      //               topLeft: Radius.circular(10),
                      //               topRight: Radius.circular(10),
                      //               bottomLeft: Radius.circular(10),
                      //               bottomRight: Radius.circular(10),
                      //             ),
                      //             color: Color.fromRGBO(255, 255, 255, 1),
                      //           )),
                      //     ],
                      //   ),
                      // ),
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
