import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ToLink extends StatefulWidget {
  final Function(String? value)? onTextChange;
  final Uri? uri;
  final String title;
  final Widget? leading;
  final bool enable;

  const ToLink({super.key, this.uri, this.title = "", this.leading, this.onTextChange, this.enable = true});

  @override
  State<ToLink> createState() => _ToLinkState();
}

class _ToLinkState extends State<ToLink> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.uri.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.uri == null
        ? const SizedBox()
        : ListTile(
            leading: widget.leading,
            title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
            titleAlignment: ListTileTitleAlignment.threeLine,
            subtitle: Align(
              alignment: Alignment.centerLeft,
              child: widget.onTextChange == null
                  ? TextButton(
                      // iconAlignment: IconAlignment.start,
                      onPressed: widget.uri == null
                          ? null
                          : () => canLaunchUrl(widget.uri!).then((result) => result ? launchUrl(widget.uri!) : debugPrint("Can't launch")),
                      child: Text(widget.uri.toString(), maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left),
                    )
                  : TextFormField(
                      enabled: widget.enable,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller,
                      onChanged: (value) => widget.onTextChange?.call(value.isEmpty ? null : value),
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
          );
  }
}
