import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/project_preview_card.dart';

class NumberSelector extends StatefulWidget {
  final int initial;
  final int max;
  final Function(int value)? onChange;
  final bool enable;

  const NumberSelector({super.key, this.onChange, this.initial = 0, this.max = 100, this.enable = true});

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  late int _value;

  @override
  void initState() {
    _value = widget.initial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Priority"),
        ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: NumberPicker(
            infiniteLoop: true,
            haptics: true,
            value: _value,
            minValue: 0,
            maxValue: widget.max,
            onChanged: (value) {
              setState(() => _value = value);
              widget.onChange?.call(_value);
            },
          ),
        ),
      ],
    );
  }
}
