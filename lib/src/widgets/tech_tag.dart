import 'dart:developer';

import 'package:flutter/material.dart';

class TechTag extends StatelessWidget {
  const TechTag({super.key, this.isRemovable = false});

  final bool isRemovable;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:  isRemovable ? Colors.red.shade50 : Colors.grey.shade200,
      ),
      // child: ,
    );
  }
}
