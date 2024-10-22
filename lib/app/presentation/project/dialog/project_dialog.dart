import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/presentation/project/project.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class ProjectDialog extends StatelessWidget {
  final Project? project;

  const ProjectDialog({super.key, this.project});

  static show(BuildContext context, {Project? project}) => showDialog(
        barrierColor: Colors.transparent,
        traversalEdgeBehavior: TraversalEdgeBehavior.parentScope,
        context: context,
        barrierDismissible: false,
        useRootNavigator: true,
        useSafeArea: true,
        builder: (_) => ProjectDialog(project: project),
      ).then((value) {
        if (!context.mounted) return;
        final bloc = BlocProvider.of<ProjectBloc>(context);
        bloc.add(ProjectEventClose(removeTempFile: bloc.state.tempFileUploaded));
      });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GlassContainer.clearGlass(
      width: size.width * 0.6,
      borderRadius: BorderRadius.circular(20),
      borderColor: Colors.transparent,
      child: ProjectPage(
        project: project,
        borderRadius: BorderRadius.zero,
        onCloseTab: () => Navigator.pop(context),
      ),
    );
  }
}
