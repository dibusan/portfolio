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
import 'package:portfolio_eriel/app/presentation/project/widgets/tech_tags.dart';
import 'package:portfolio_eriel/app/shared/__.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class ProjectPage extends StatefulWidget {
  Project? project;
  final Function()? onCloseTab;
  final BorderRadius? borderRadius;

  ProjectPage({super.key, this.project, this.onCloseTab, this.borderRadius});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  late Project localProject;
  late TextEditingController _name;
  late TextEditingController _subtitle;
  late TextEditingController _description;
  final TextEditingController _techTag = TextEditingController();

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
      BlocProvider.of<ProjectBloc>(context).add(ProjectEventUpdate(
          projectId: widget.project?.id,
          project: p,
          onDone: (Project project) {
            setState(() {
              localProject = project;
              widget.project = project;
            });
          }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _delete() {
    if (widget.project != null) {
      BlocProvider.of<ProjectBloc>(context).add(ProjectEventDelete(projectId: widget.project!.id, onDelete: () => context.pop()));
    }
  }

  _imageOnlyLocal(String image) {
    return !(widget.project?.images.contains(image) ?? false) && localProject.images.contains(image);
  }

  _imageOnlyRemote(String image) {
    return (widget.project?.images.contains(image) ?? false) && !localProject.images.contains(image);
  }

  @override
  Widget build(BuildContext context) {
    final isAuth = BlocProvider.of<SecurityBloc>(context).state.isAuth;
    final List<String> allImages = <String>{...(widget.project?.images ?? []), ...localProject.images}.toList();

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
                          InkWell(
                            onLongPress: projectState.requesting ? null : _delete,
                            borderRadius: BorderRadius.circular(50),
                            child: Tooltip(
                              message: "remove is long press",
                              child: CircleAvatar(
                                backgroundColor: Colors.red.shade100,
                                child: Icon(Icons.remove_circle, color: projectState.requesting ? Colors.grey : Colors.red),
                              ),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            // Logo -> Title -> Subtitles
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: double.maxFinite,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ProjectLogo(
                                          size: const Size(120, 120),
                                          imageUrl: localProject.logoUrl,
                                          onEdit: isAuth && !projectState.requesting
                                              ? () async {
                                                  BlocProvider.of<ProjectBloc>(context).add(
                                                    ProjectEventUploadFile(
                                                      project: localProject,
                                                      multiple: false,
                                                      onResult: (value) {
                                                        if (value.isEmpty) return;
                                                        setState(() => localProject = localProject.copyWith(logoUrl: value.first));
                                                      },
                                                    ),
                                                  );
                                                }
                                              : null,
                                        ),
                                        const HSp16(),
                                        SizedBox(
                                            width: 300,
                                            height: 90,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: Center(
                                                    child: MyFieldWithText(
                                                      controller: _name,
                                                      text: localProject.title ?? "",
                                                      inputDecoration: const InputDecoration(labelText: "Title"),
                                                      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ),
                                                ),
                                                const VSp10(),
                                                Expanded(
                                                  child: Align(
                                                    alignment: isAuth ? Alignment.center : Alignment.topCenter,
                                                    child: MyFieldWithText(
                                                      controller: _subtitle,
                                                      text: localProject.subtitle ?? "",
                                                      inputDecoration: const InputDecoration(labelText: "Subtitle"),
                                                      textStyle: const TextStyle(fontSize: 16),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                  const VSp24(),
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

                            isAuth
                                ? Container(
                                    margin: const EdgeInsets.symmetric(vertical: 10),
                                    width: 150,
                                    child: SearchTags(
                                      submitted: (value) {
                                        _techTag.clear();
                                        List<String> newList = localProject.techTags.where((e) => e != value).toList();
                                        setState(() => localProject = localProject.copyWith(techTags: [...newList, value]));
                                      },
                                    ),
                                  )
                                : const Text(
                                    "Tech Stack",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  ),

                            const VSp10(),
                            TechTagsWrap(
                              techTags: localProject.techTags,
                              backgroundColor: Colors.white,
                              techTagsOrder: isAuth
                                  ? (newIndex, oldIndex) {
                                      List<String> reordenable = localProject.techTags.toList();
                                      reordenable.insert(newIndex, reordenable.removeAt(oldIndex));
                                      setState(() => localProject = localProject.copyWith(techTags: reordenable));
                                    }
                                  : null,
                              onRemove: isAuth
                                  ? (value) {
                                      List<String> newList = localProject.techTags.where((e) => e != value).toList();

                                      setState(() => localProject = localProject.copyWith(techTags: newList));
                                    }
                                  : null,
                            ),
                            const VSp10(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (isAuth) ...const [
                                  SizedBox(width: 48),
                                  HSp16(),
                                ],
                                const Text(
                                  "Media example",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                if (isAuth) ...[
                                  const HSp16(),
                                  CircleAvatar(
                                    child: IconButton(
                                        onPressed: () {
                                          BlocProvider.of<ProjectBloc>(context).add(ProjectEventUploadFile(
                                              project: localProject,
                                              multiple: true,
                                              onResult: (value) {
                                                setState(() => localProject = localProject.copyWith(images: [...localProject.images, ...value]));
                                              }));
                                        },
                                        icon: const Icon(Icons.add)),
                                  ),
                                ]
                              ],
                            ),
                            const VSp8(),
                            // Images

                            if (allImages.isNotEmpty)
                              LayoutBuilder(builder: (context, constrains) {
                                final dec = BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.white, width: 2),
                                );
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: allImages.length == 1
                                      ? Container(
                                          height: 300,
                                          decoration: dec,
                                          child: ImageOnCache(
                                            imageUrl: allImages.first,
                                            boxDecoration: dec,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : CarouselSlider(
                                          options: CarouselOptions(height: 300.0, autoPlay: true, viewportFraction: 0.6),
                                          items: allImages.map((i) {
                                            return Builder(
                                              builder: (BuildContext context) {
                                                return Container(
                                                  width: constrains.maxWidth * 0.8,
                                                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                                  decoration: dec,
                                                  child: Stack(
                                                    children: [
                                                      ImageOnCache(
                                                        imageUrl: i,
                                                        boxDecoration: dec,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      if (_imageOnlyLocal(i))
                                                        Container(
                                                          width: double.maxFinite,
                                                          height: double.maxFinite,
                                                          decoration: BoxDecoration(
                                                            color: Colors.grey.withOpacity(0.6),
                                                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                                                          ),
                                                          child: const Center(child: Text("Pending Uploading when save...")),
                                                        ),
                                                      if (_imageOnlyRemote(i))
                                                        Container(
                                                          width: double.maxFinite,
                                                          height: double.maxFinite,
                                                          decoration: BoxDecoration(
                                                            color: Colors.grey.withOpacity(0.6),
                                                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                                                          ),
                                                          child: const Center(child: Text("Pending Remove when save....")),
                                                        ),
                                                      Positioned(
                                                        right: 10,
                                                        top: 10,
                                                        child: CircleAvatar(
                                                          radius: 16,
                                                          backgroundColor: Colors.grey.withOpacity(0.8),
                                                          child: IconButton(
                                                            onPressed: () {
                                                              if (_imageOnlyRemote(i)) {
                                                                setState(
                                                                    () => localProject = localProject.copyWith(images: [...localProject.images, i]));
                                                                return;
                                                              }
                                                              BlocProvider.of<ProjectBloc>(context).add(ProjectEventClose(removeTempFile: [i]));
                                                              setState(() => localProject =
                                                                  localProject.copyWith(images: localProject.images.where((e) => e != i).toList()));
                                                            },
                                                            icon: Icon(_imageOnlyRemote(i) ? Icons.cancel_outlined : Icons.remove_circle),
                                                            iconSize: 16,
                                                          ),
                                                        ),
                                                      )
                                                    ],
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
