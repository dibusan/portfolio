import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/bloc/security/security_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:portfolio_eriel/app/presentation/project/dialog/field.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/images_carousel.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/number_selector.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/project_logo.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/tech_tag_wrap.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/tech_tags.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/to_link.dart';
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
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  late TextEditingController _name;
  late TextEditingController _projectOwner;
  late TextEditingController _subtitle;
  late TextEditingController _salary;
  late HtmlEditorController _description;

  @override
  void initState() {
    localProject = widget.project ?? const Project(id: 'new', title: '');
    _name = TextEditingController(text: localProject.title);
    _salary = TextEditingController(text: localProject.salary?.toString());
    _subtitle = TextEditingController(text: localProject.subtitle);
    _description = HtmlEditorController();
    _projectOwner = TextEditingController(text: localProject.projectOwner);
    super.initState();
  }

  _save() async {
    if (!(_form.currentState?.validate() ?? false)) return;
    final bloc = BlocProvider.of<ProjectBloc>(context);
    try {
      Map<String, dynamic> jsonData = {
        "id": DateTime.now().microsecondsSinceEpoch.toString(),
        ...localProject.toJson(),
        "title": _name.text,
        "subtitle": _subtitle.text,
        "description": await _description.getText(),
        "projectOwner": _projectOwner.text,
        "salary": double.tryParse(_salary.text),
      };
      Project p = Project.fromJson(jsonData);
      bloc.add(ProjectEventUpdate(
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

  @override
  Widget build(BuildContext context) {
    final isAuth = BlocProvider.of<SecurityBloc>(context).state.isAuth;
    final List<String> allImages = <String>{...(widget.project?.images ?? []), ...localProject.images}.toList();

    return BlocBuilder<ProjectBloc, ProjectState>(
      buildWhen: (oldState, newState) {
        return oldState.requesting != newState.requesting || oldState.selected != newState.selected;
      },
      builder: (context, projectState) {
        return GlassContainer.clearGlass(
          borderColor: Colors.white,
          elevation: 50,
          borderRadius: widget.borderRadius ?? const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          color: Colors.white.withOpacity(0.3),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Row(
                children: [
                  Flexible(
                    child: Transform.flip(
                      child: ListTile(
                        title: Align(alignment: Alignment.centerRight, child: Text("Start: ${localProject.formatStartDate()}")),
                        leading: localProject.startDate == widget.project?.startDate
                            ? null
                            : IconButton(
                                onPressed: () => setState(() => localProject = localProject.copyWith(startDate: widget.project?.startDate)),
                                icon: const Icon(Icons.clear)),
                        trailing: !isAuth
                            ? null
                            : IconButton(
                                onPressed: () async {
                                  final result = await showDatePicker(
                                    context: context,
                                    initialDate: localProject.startDate,
                                    firstDate: DateTime(1998),
                                    lastDate: DateTime.now(),
                                    builder: (_, child) => PointerInterceptor(child: child ?? const SizedBox()),
                                  );
                                  if (result == null) return;
                                  setState(() => localProject = localProject.copyWith(startDate: result));
                                },
                                icon: const Icon(Icons.date_range)),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      title: Text("End: ${localProject.formatEndDate()}"),
                      trailing: localProject.endDate == widget.project?.endDate
                          ? null
                          : IconButton(
                              onPressed: () => setState(() => localProject = localProject.copyWith(endDate: widget.project?.endDate)),
                              icon: const Icon(Icons.clear)),
                      leading: !isAuth
                          ? null
                          : IconButton(
                              onPressed: () async {
                                final result = await showDatePicker(
                                  context: context,
                                  initialDate: localProject.endDate,
                                  firstDate: DateTime(1998),
                                  lastDate: DateTime.now(),
                                  builder: (_, child) => PointerInterceptor(child: child ?? const SizedBox()),
                                );
                                if (result == null) return;
                                setState(() => localProject = localProject.copyWith(endDate: result));
                              },
                              icon: const Icon(Icons.date_range)),
                    ),
                  ),
                  Flexible(
                    child: MyFieldWithText(
                      enable: !projectState.requesting,
                      controller: _salary,
                      text: "\$ ${localProject.salary?.toString() ?? ""}",
                      inputDecoration: const InputDecoration(labelText: "Salary", hintText: "Salary"),
                      textStyle: const TextStyle(fontSize: 16),
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return null;
                        }
                        final salary = double.tryParse(v);
                        if (salary == null) {
                          return "Please enter a valid number.";
                        }
                        if (salary <= 0) {
                          return "Salary must be greater than zero.";
                        }
                        return null;
                      },
                    ),
                  )
                ],
              ),
              leading: IconButton(
                onPressed: projectState.requesting
                    ? null
                    : widget.onCloseTab ??
                        () {
                          BlocProvider.of<ProjectBloc>(context).add(const ProjectEventSelect(project: null));
                        },
                icon: Icon(Icons.arrow_back, color: projectState.requesting ? Colors.grey : Colors.black),
              ),
              actions: !isAuth
                  ? []
                  : [
                      SizedBox(
                        width: 150,
                        child: CheckboxListTile(
                          visualDensity: VisualDensity.compact,
                          title: const Text("Personal"),
                          dense: true,
                          value: localProject.isPersonal,
                          onChanged: (value) => setState(() => localProject = localProject.copyWith(isPersonal: value ?? false)),
                        ),
                      ),
                      const HSp10(),
                      if (widget.project != null)
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
                      const HSp10(),
                      CircleAvatar(
                        backgroundColor: Colors.green.shade100,
                        child: IconButton(
                          onPressed: projectState.requesting ? null : _save,
                          icon: Icon(Icons.save, color: projectState.requesting ? Colors.grey : Colors.green),
                        ),
                      ),
                      const HSp10(),
                    ],
              flexibleSpace: Container(
                height: 10,
                padding: const EdgeInsets.only(bottom: 5),
                child: projectState.requesting || projectState.loading
                    ? ClipRRect(borderRadius: BorderRadius.circular(20), child: const LinearProgressIndicator())
                    : null,
              ),
            ),
            body: Form(
              key: _form,
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
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
                                  if (isAuth)
                                    NumberSelector(
                                      initial: localProject.priority,
                                      max: projectState.projects.length + (widget.project == null ? 1 : 0),
                                      onChange: (value) => localProject = localProject.copyWith(priority: value),
                                    ),
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
                                              enable: !projectState.requesting,
                                              controller: _name,
                                              text: localProject.title ?? "",
                                              inputDecoration: const InputDecoration(labelText: "Title"),
                                              textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                                            ),
                                          ),
                                        ),
                                        const VSp10(),
                                        Expanded(
                                          child: Align(
                                            alignment: isAuth ? Alignment.center : Alignment.topCenter,
                                            child: MyFieldWithText(
                                              enable: !projectState.requesting,
                                              controller: _subtitle,
                                              text: localProject.subtitle ?? "",
                                              inputDecoration: const InputDecoration(labelText: "Subtitle"),
                                              textStyle: const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const VSp24(),
                            MyHtmlText(
                              controller: _description,
                              enable: !projectState.requesting,
                              initialText: localProject.description ?? "",
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
                                hintText: "Tech Stack",
                                enable: !projectState.requesting,
                                submitted: (value) {
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
                        keyWrap: "Tech",
                        techTags: localProject.techTags,
                        backgroundColor: Colors.white,
                        techTagsOrder: isAuth && !projectState.requesting
                            ? (newIndex, oldIndex) {
                                List<String> reordenable = localProject.techTags.toList();
                                reordenable.insert(newIndex, reordenable.removeAt(oldIndex));
                                setState(() => localProject = localProject.copyWith(techTags: reordenable));
                              }
                            : null,
                        onRemove: isAuth && !projectState.requesting
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
                                  onPressed: projectState.requesting
                                      ? null
                                      : () {
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
                        ImagesCarousel(
                          enable: !projectState.requesting && isAuth,
                          allImages: allImages,
                          remotes: widget.project?.images ?? [],
                          locals: localProject.images,
                          onDelete: (image, onlyRemote) {
                            if (onlyRemote) {
                              setState(() => localProject = localProject.copyWith(images: [...localProject.images, image]));
                              return;
                            }
                            BlocProvider.of<ProjectBloc>(context).add(ProjectEventClose(removeTempFile: [image]));
                            setState(() => localProject = localProject.copyWith(images: localProject.images.where((e) => e != image).toList()));
                          },
                        ),
                      const VSp24(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                ToLink(
                                  enable: !projectState.requesting,
                                  title: "Github",
                                  leading: Image.asset('/images/github.png'),
                                  uri: localProject.githubLink == null && !isAuth ? null : Uri.tryParse(localProject.githubLink ?? ""),
                                  onTextChange: isAuth ? (value) => localProject = localProject.copyWith(githubLink: value) : null,
                                ),
                                ToLink(
                                  enable: !projectState.requesting,
                                  title: "Application",
                                  leading: Image.asset('/images/application.png'),
                                  uri: localProject.appLink == null && !isAuth ? null : Uri.tryParse(localProject.appLink ?? ""),
                                  onTextChange: isAuth ? (value) => localProject = localProject.copyWith(appLink: value) : null,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(20)),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Owner Info", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                                    const VSp8(),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            ProjectLogo(
                                              size: const Size(120, 120),
                                              imageUrl: localProject.projectOwnerLogoUrl,
                                              onEdit: isAuth && !projectState.requesting
                                                  ? () async {
                                                      BlocProvider.of<ProjectBloc>(context).add(
                                                        ProjectEventUploadFile(
                                                          project: localProject,
                                                          multiple: false,
                                                          onResult: (value) {
                                                            if (value.isEmpty) return;
                                                            setState(() => localProject = localProject.copyWith(projectOwnerLogoUrl: value.first));
                                                          },
                                                        ),
                                                      );
                                                    }
                                                  : null,
                                            ),
                                            if (isAuth)
                                              Container(
                                                margin: const EdgeInsets.only(top: 16),
                                                width: 160,
                                                child: SearchTags(
                                                  hintText: "Industries Tags",
                                                  suggestions:
                                                      Project.allIndustriesTags(projects: BlocProvider.of<ProjectBloc>(context).state.projects),
                                                  enable: !projectState.requesting,
                                                  submitted: (value) {
                                                    List<String> newList = localProject.industries.where((e) => e != value).toList();
                                                    setState(() => localProject = localProject.copyWith(industries: [...newList, value]));
                                                  },
                                                ),
                                              ),
                                          ],
                                        ),
                                        const HSp16(),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              MyFieldWithText(
                                                enable: !projectState.requesting,
                                                controller: _projectOwner,
                                                text: localProject.projectOwner ?? "",
                                                inputDecoration: const InputDecoration(labelText: "Project Owner"),
                                                textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                              ),
                                              const VSp24(),
                                              TechTagsWrap(
                                                keyWrap: "Industries",
                                                techTags: localProject.industries,
                                                backgroundColor: Colors.white,
                                                techTagsOrder: isAuth && !projectState.requesting
                                                    ? (newIndex, oldIndex) {
                                                        List<String> reordenable = localProject.industries.toList();
                                                        reordenable.insert(newIndex, reordenable.removeAt(oldIndex));
                                                        setState(() => localProject = localProject.copyWith(industries: reordenable));
                                                      }
                                                    : null,
                                                onRemove: isAuth && !projectState.requesting
                                                    ? (value) {
                                                        List<String> newList = localProject.industries.where((e) => e != value).toList();

                                                        setState(() => localProject = localProject.copyWith(industries: newList));
                                                      }
                                                    : null,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 200)
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
