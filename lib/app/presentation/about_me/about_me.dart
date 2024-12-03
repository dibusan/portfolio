import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/presentation/home/leftBar/small_banding_banner.dart';
import 'package:portfolio_eriel/app/presentation/project/dialog/field.dart';
import 'package:portfolio_eriel/app/shared/spacers.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class AboutMeDialog extends StatefulWidget {
  Developer developer;

  AboutMeDialog({super.key, required this.developer});

  static show(BuildContext context, {required Developer developer}) => showDialog(
        barrierColor: Colors.transparent,
        traversalEdgeBehavior: TraversalEdgeBehavior.parentScope,
        context: context,
        barrierDismissible: false,
        useRootNavigator: true,
        useSafeArea: true,
        builder: (_) => AboutMeDialog(developer: developer),
      ).then((value) {
        if (!context.mounted) return;
        final bloc = BlocProvider.of<ProjectBloc>(context);
        bloc.add(ProjectEventClose(removeTempFile: bloc.state.tempFileUploaded));
      });

  @override
  State<AboutMeDialog> createState() => _AboutMeDialogState();
}

class _AboutMeDialogState extends State<AboutMeDialog> {
  late Developer localDeveloper;
  late HtmlEditorController _description;

  @override
  void initState() {
    localDeveloper = widget.developer;
    _description = HtmlEditorController();
    super.initState();
  }

  _save() async {
    final bloc = BlocProvider.of<ProjectBloc>(context);
    try {
      Map<String, dynamic> jsonData = {
        "id": DateTime.now().microsecondsSinceEpoch.toString(),
        ...localDeveloper.toJson(),
        "description": await _description.getText(),
      };
      bloc.add(
        DeveloperEventUpdate(
          developer: Developer.fromJson(jsonData),
          onDone: (Developer deve) {
            setState(() {
              localDeveloper = deve;
              widget.developer = deve;
            });
          },
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GlassContainer.clearGlass(
      width: size.width * 0.6,
      borderRadius: BorderRadius.circular(20),
      borderColor: Colors.transparent,
      child: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              actions: [IconButton(onPressed: _save, icon: const Icon(Icons.save))],
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    padding: const EdgeInsets.only(bottom: 5),
                    child: state.requesting || state.loading
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const LinearProgressIndicator(),
                          )
                        : null,
                  ),
                  Stack(
                    children: [
                      AbsorbPointer(absorbing: true, child: SizedBox(width: 300, height: 300, child: SmallBrandingBanner(developer: localDeveloper))),
                      // Positioned(right: 0, bottom: 0, child: IconButton(onPressed: () {}, icon: const Icon(Icons.change_circle_outlined)))
                    ],
                  ),
                  const VSp24(),
                  MyHtmlText(
                    controller: _description,
                    enable: !state.requesting,
                    initialText: localDeveloper.description ?? "",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
