import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_eriel/app/presentation/project/dialog/field.dart';
import 'package:portfolio_eriel/app/shared/__.dart';
import 'package:portfolio_eriel/app/shared/responsive/device.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';
import 'package:url_launcher/url_launcher.dart';

class SecretPage extends StatelessWidget {
  const SecretPage({super.key});

  static updateUrMetadataProject(BuildContext context, {required Project project, required Map<String, dynamic> urlMetadata}) {
    final updatedMetadata = {...project.metadata, 'urls': urlMetadata};
    final Project pTemp = project.copyWith(metadata: updatedMetadata, appLink: urlMetadata['appLink'] ?? project.appLink);

    final bloc = BlocProvider.of<ProjectBloc>(context);
    bloc.add(ProjectEventUpdate(projectId: project.id, project: pTemp));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            flexibleSpace: state.loading || state.requesting ? const LinearProgressIndicator() : null,
          ),
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (_, i) => const Divider(),
                itemBuilder: (_, index) {
                  final proj = state.projects[index];

                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: ImageOnCache(imageUrl: proj.logoUrl ?? ""),
                        ),
                        title: Text(proj.title),
                        subtitle: Text(proj.subtitle ?? ""),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.blue.withOpacity(0.3),
                          child: IconButton(
                              onPressed: () {
                                showDialog(context: context, builder: (_) => DialogAddUrl(project: proj));
                              },
                              icon: const Icon(Icons.add)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: SingleChildScrollView(
                          child: Column(
                            children: ((proj.metadata['urls'] ?? {})..addAll({'appLink': proj.appLink})).keys.map(
                              (e) {
                                final url = Uri.parse((proj.metadata['urls'] ?? {})[e] ?? "");
                                return ListTile(
                                  title: Text(e),
                                  subtitle: Text(url.toString()),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        onTap: () => canLaunchUrl(url).then((result) => result ? launchUrl(url) : debugPrint("Can't launch")),
                                        child: CircleAvatar(
                                          radius: 16,
                                          backgroundColor: Colors.white.withOpacity(0.3),
                                          child: const Icon(Icons.open_in_new, size: 16),
                                        ),
                                      ),
                                      const HSp10(),
                                      InkWell(
                                        onTap: () {
                                          showDialog(context: context, builder: (_) => DialogAddUrl(project: proj, keyUrl: e));
                                        },
                                        child: CircleAvatar(
                                          radius: 16,
                                          backgroundColor: Colors.green.withOpacity(0.3),
                                          child: const Icon(Icons.edit, size: 16),
                                        ),
                                      ),
                                      const HSp10(),
                                      InkWell(
                                        onLongPress: () {
                                          final urlMetadata = Map<String, dynamic>.from(proj.metadata['urls'] ?? {});
                                          urlMetadata.remove(e);
                                          SecretPage.updateUrMetadataProject(context, project: proj, urlMetadata: urlMetadata);
                                        },
                                        child: CircleAvatar(
                                          radius: 16,
                                          backgroundColor: Colors.red.withOpacity(0.3),
                                          child: const Icon(Icons.remove, size: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      )
                    ],
                  );
                },
                itemCount: state.projects.length,
              )
            ],
          ),
        );
      },
    );
  }
}

class DialogAddUrl extends StatefulWidget {
  final Project project;
  final String? keyUrl;

  const DialogAddUrl({super.key, required this.project, this.keyUrl});

  @override
  State<DialogAddUrl> createState() => _DialogAddUrlState();
}

class _DialogAddUrlState extends State<DialogAddUrl> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  late bool editKey;
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  void initState() {
    editKey = widget.keyUrl != null;
    if (editKey) {
      controller1.text = widget.keyUrl!;
      controller2.text = (widget.project.metadata['urls'] ?? {})[widget.keyUrl] ?? "";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (_, state) {
        final isLoading = state.requesting || state.loading;
        return AlertDialog(
          title: AppBar(title: Text(editKey ? "Edit Url" : "Add Url"), backgroundColor: Colors.transparent),
          backgroundColor: Colors.grey,
          content: SizedBox(
            width: context.isMobile ? size.width : size.width * 0.5,
            child: Form(
              key: _key,
              child: Row(
                children: [
                  Expanded(
                    child: MyFieldWithText(
                      controller: controller1,
                      text: controller1.text,
                      inputDecoration: const InputDecoration(hintText: "Identifier"),
                      enable: !editKey,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const HSp16(),
                  Expanded(
                    flex: 3,
                    child: MyFieldWithText(
                      controller: controller2,
                      text: controller2.text,
                      inputDecoration: const InputDecoration(hintText: "Url"),
                      textAlign: TextAlign.left,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return null;
                        }
                        if (Uri.parse(value!).host.isEmpty) {
                          return "Type correct Uri";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text(
                "Close",
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: isLoading
                  ? null
                  : () {
                      if (_key.currentState?.validate() ?? false) {
                        final urlMetadata = Map<String, dynamic>.from(widget.project.metadata['urls'] ?? {})..[controller1.text] = controller2.text;
                        SecretPage.updateUrMetadataProject(context, project: widget.project, urlMetadata: urlMetadata);
                      }
                    },
              child: const Text(
                "Save",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            )
          ],
        );
      },
    );
  }
}
