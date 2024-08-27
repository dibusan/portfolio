import 'package:flutter/material.dart';

class TechTag extends StatelessWidget {
  final String name;
  final Function()? onTap;
  final Function()? onRemoved;

  const TechTag({super.key, required this.name, this.onTap, this.onRemoved});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: WidgetStateProperty.all(onRemoved == null ? Colors.grey.shade200 : Colors.red.shade50),
        label: Text(name),
        padding: EdgeInsets.zero,
        onDeleted: onRemoved,
      ),
    );
  }
}
