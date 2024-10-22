import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/bloc/security/security_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_eriel/app/presentation/project/dialog/field.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/project_logo.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/tech_tag_wrap.dart';
import 'package:portfolio_eriel/app/shared/__.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class ProjectPage extends StatefulWidget {
  final Project? project;
  final Function()? onCloseTab;
  final BorderRadius? borderRadius;

  const ProjectPage({super.key, this.project, this.onCloseTab, this.borderRadius});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  late Project localProject;
  late TextEditingController _name;
  late TextEditingController _subtitle;
  late TextEditingController _description;

  @override
  void initState() {
    localProject = widget.project ?? const Project(id: 'new', title: '');
    _name = TextEditingController(text: localProject.title);
    _subtitle = TextEditingController(text: localProject.subtitle);
    _description = TextEditingController(text: localProject.description);
    super.initState();
  }

  _save() {
    try {
      Map<String, dynamic> jsonData = {
        "id": DateTime.now().microsecondsSinceEpoch.toString(),
        ...localProject.toJson(),
        "title": _name.text,
        "subtitle": _subtitle.text,
        "description": _description.text
      };
      Project p = Project.fromJson(jsonData);
      BlocProvider.of<ProjectBloc>(context).add(ProjectEventUpdate(projectId: widget.project?.id, project: p));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _delete() {
    if (widget.project != null) {
      BlocProvider.of<ProjectBloc>(context).add(ProjectEventDelete(projectId: widget.project!.id, onDelete: () => context.pop()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isAuth = BlocProvider.of<SecurityBloc>(context).state.isAuth;

    return BlocBuilder<ProjectBloc, ProjectState>(
      buildWhen: (oldState, newState) {
        return oldState.requesting != newState.requesting || oldState.selected != newState.selected;
      },
      builder: (context, projectState) {
        return Material(
          type: MaterialType.transparency,
          child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: GlassContainer.clearGlass(
                borderColor: Colors.white,
                elevation: 50,
                borderRadius: widget.borderRadius ?? const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                color: Colors.white.withOpacity(0.3),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      height: 10,
                      padding: const EdgeInsets.only(bottom: 5),
                      child: projectState.requesting || projectState.loading
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: const LinearProgressIndicator(),
                            )
                          : null,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (widget.project != null && isAuth) ...[
                          CircleAvatar(
                            backgroundColor: Colors.red.shade100,
                            child: IconButton(
                              onPressed: projectState.requesting ? null : _delete,
                              icon: Icon(Icons.delete, color: projectState.requesting ? Colors.grey : Colors.red),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                        ],
                        if (isAuth) ...[
                          CircleAvatar(
                            backgroundColor: Colors.green.shade100,
                            child: IconButton(
                              onPressed: projectState.requesting ? null : _save,
                              icon: Icon(Icons.save, color: projectState.requesting ? Colors.grey : Colors.green),
                            ),
                          ),
                        ],
                        const HSp16(),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: projectState.requesting
                                ? null
                                : widget.onCloseTab ??
                                    () {
                                      BlocProvider.of<ProjectBloc>(context).add(const ProjectEventSelect(project: null));
                                    },
                            icon: Icon(Icons.close, color: projectState.requesting ? Colors.grey : Colors.black),
                          ),
                        ),
                      ],
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
                                  ProjectLogo(
                                    imageUrl: localProject.logoUrl,
                                    onEdit: isAuth
                                        ? () async {
                                            BlocProvider.of<ProjectBloc>(context).add(ProjectEventUploadFile(
                                                project: localProject,
                                                onResult: (value) {
                                                  setState(() => localProject = localProject.copyWith(logoUrl: value));
                                                }));
                                          }
                                        : null,
                                  ),
                                  const VSp8(),
                                  MyFieldWithText(
                                    width: 300,
                                    controller: _name,
                                    text: localProject.title ?? "",
                                    inputDecoration: const InputDecoration(labelText: "Title"),
                                    textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                  const VSp8(),
                                  MyFieldWithText(
                                    width: 300,
                                    controller: _subtitle,
                                    text: localProject.subtitle ?? "",
                                    inputDecoration: const InputDecoration(labelText: "Subtitle"),
                                    textStyle: const TextStyle(fontSize: 16),
                                  ),
                                  const VSp8(),
                                  MyFieldWithText(
                                    controller: _description,
                                    text: localProject.description ?? "",
                                    inputDecoration: const InputDecoration(labelText: "Description"),
                                    textStyle: const TextStyle(fontSize: 16),
                                    maxLines: 3,
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
                              techTags: localProject.techTags,
                              backgroundColor: Colors.white,
                              onRemove: isAuth
                                  ? (value) {
                                      List<String> newList = localProject.techTags.where((e) => e != value).toList();

                                      setState(() => localProject = localProject.copyWith(techTags: newList));
                                    }
                                  : null,
                              onAdd: isAuth
                                  ? (value) {
                                      List<String> newList = localProject.techTags.where((e) => e != value).toList();
                                      setState(() => localProject = localProject.copyWith(techTags: [...newList, value]));
                                    }
                                  : null,
                            ),
                            const VSp10(),
                            const Text(
                              "Media example",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const VSp8(),
                            // Images
                            if (widget.project?.images != null)
                              LayoutBuilder(builder: (context, constrains) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: CarouselSlider(
                                    options: CarouselOptions(
                                      height: 300.0,
                                      autoPlay: true,
                                    ),
                                    items: widget.project?.images.map((i) {
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
      },
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
