import 'package:flutter/material.dart';

class TechTag extends StatelessWidget {
  final String name;
  final Function()? onTap;
  final Function()? onRemoved;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;

  const TechTag({
    super.key,
    required this.name,
    this.onTap,
    this.onRemoved,
    this.borderColor = Colors.white,
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.black45,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? onRemoved,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        constraints: const BoxConstraints(minWidth: 50),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: borderColor ?? Colors.white, width: 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            if (onRemoved != null) ...[
              const SizedBox(width: 5),
              const CircleAvatar(radius: 8, child: Icon(Icons.close, size: 12)),
            ]
          ],
        ),
      ),
    );
  }
}
