import 'package:flutter/material.dart';

class TimePeriodSelection extends StatelessWidget {
  const TimePeriodSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildChip("All"),
        buildChip("6 months"),
        buildChip("1 year"),
      ],
    );
  }

  Widget buildChip(String label) {
    return Container(
      width: 72,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: Center(
        child: Text(
          label,
          textScaler: const TextScaler.linear(0.8),
        ),
      ),
    );
  }
}
