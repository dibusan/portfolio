import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_eriel/app/presentation/project/dialog/field.dart';
import 'package:portfolio_eriel/app/shared/__.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';
import 'package:url_launcher/url_launcher.dart';

class SecretPage extends StatelessWidget {
  const SecretPage({super.key});

  /// Updates the URL metadata for a project.
  static void updateUrlMetadata(BuildContext context, {required Project project, required Map<String, dynamic> urlMetadata}) {
    final updatedMetadata = {...project.metadata, "${Project.urlsInMetadataKey}": urlMetadata};
    final updatedProject = project.copyWith(
      metadata: updatedMetadata,
      appLink: urlMetadata['appLink'] ?? project.appLink,
    );

    context.read<ProjectBloc>().add(ProjectEventUpdate(projectId: project.id, project: updatedProject));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      buildWhen: (previous, current) => previous.projects != current.projects || previous.loading != current.loading,
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
              _buildBackground(),
              _buildProjectList(context, state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProjectList(BuildContext context, ProjectState state) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: kToolbarHeight),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: state.projects.length,
      itemBuilder: (_, index) {
        final project = state.projects[index];
        return _buildProjectTile(context, project);
      },
    );
  }

  Widget _buildProjectTile(BuildContext context, Project project) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            child: ImageOnCache(imageUrl: project.logoUrl ?? ""),
          ),
          title: Text(project.title),
          subtitle: Text(project.subtitle ?? ""),
          trailing: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddUrlDialog(context, project),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100),
          child: _buildUrlList(context, project),
        ),
      ],
    );
  }

  Widget _buildUrlList(BuildContext context, Project project) {
    final urls = Map<String, dynamic>.from(project.metadata[Project.urlsInMetadataKey] ?? {})..addAll({'appLink': project.appLink});

    return Column(
      children: urls.entries.map((entry) {
        final urlKey = entry.key;
        final urlValue = Uri.tryParse(entry.value ?? "");

        return ListTile(
          title: Text(urlKey),
          subtitle: Text(urlValue?.toString() ?? ""),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIconButton(
                icon: Icons.open_in_new,
                color: Colors.blue,
                onTap: () => _launchUrl(urlValue),
              ),
              const HSp10(),
              _buildIconButton(
                icon: Icons.edit,
                color: Colors.green,
                onTap: () => _showAddUrlDialog(context, project, urlKey: urlKey),
              ),
              const HSp10(),
              _buildIconButton(
                icon: Icons.remove,
                color: Colors.red,
                onLongPress: () => _removeUrl(context, project, urlKey),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildIconButton({required IconData icon, required Color color, VoidCallback? onTap, VoidCallback? onLongPress}) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: CircleAvatar(
        radius: 16,
        backgroundColor: color.withOpacity(0.3),
        child: Icon(icon, size: 16),
      ),
    );
  }

  void _launchUrl(Uri? url) {
    if (url != null) {
      canLaunchUrl(url).then((result) {
        if (result) {
          launchUrl(url);
        } else {
          debugPrint("Cannot launch URL: $url");
        }
      });
    }
  }

  void _removeUrl(BuildContext context, Project project, String urlKey) {
    final urlMetadata = Map<String, dynamic>.from(project.metadata[Project.urlsInMetadataKey] ?? {})..remove(urlKey);
    updateUrlMetadata(context, project: project, urlMetadata: urlMetadata);
  }

  void _showAddUrlDialog(BuildContext context, Project project, {String? urlKey}) {
    showDialog(
      context: context,
      builder: (_) => DialogAddUrl(project: project, keyUrl: urlKey),
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
  final GlobalKey<FormState> _formKey = GlobalKey();
  late final bool isEditing;

  @override
  void initState() {
    isEditing = widget.keyUrl != null;

    if (isEditing) {
      controller1.text = widget.keyUrl!;
      controller2.text =
          ((widget.project.metadata[Project.urlsInMetadataKey] ?? {})[widget.keyUrl]) ?? (widget.keyUrl == 'appLink' ? widget.project.appLink : "");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: AppBar(
        title: Text(isEditing ? "Edit URL" : "Add URL"),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey,
      content: _buildForm(context),
      actions: _buildActions(context),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
            child: MyFieldWithText(
              controller: controller1,
              text: controller1.text,
              inputDecoration: const InputDecoration(hintText: "Identifier"),
              enable: !isEditing,
            ),
          ),
          const HSp16(),
          Expanded(
            flex: 3,
            child: MyFieldWithText(
              controller: controller2,
              text: controller2.text,
              inputDecoration: const InputDecoration(hintText: "URL"),
              validator: _urlValidator,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () => context.pop(),
        child: const Text("Close", style: TextStyle(color: Colors.black)),
      ),
      TextButton(
        onPressed: _saveUrl,
        child: const Text("Save", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
      ),
    ];
  }

  void _saveUrl() {
    if (_formKey.currentState?.validate() ?? false) {
      final urlMetadata = Map<String, dynamic>.from(widget.project.metadata[Project.urlsInMetadataKey] ?? {})..[controller1.text] = controller2.text;

      SecretPage.updateUrlMetadata(context, project: widget.project, urlMetadata: urlMetadata);
      context.pop();
    }
  }

  String? _urlValidator(String? value) {
    if (value == null || value.isEmpty) return "URL cannot be empty";
    if (Uri.tryParse(value)?.host.isEmpty ?? true) return "Enter a valid URL";
    return null;
  }
}
