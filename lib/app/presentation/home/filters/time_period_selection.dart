import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/event.dart';
import 'package:portfolio_eriel/app/bloc/filter/state.dart';
import 'package:portfolio_eriel/app/shared/__.dart';

class TimePeriodSelection extends StatelessWidget {
  const TimePeriodSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        return Column(
          children: [
            const Text("Time period selection"),
            const VSp10(),
            Wrap(
              children: state.dates
                  .map(
                    (e) => buildChip(
                      e.title,
                      selected: e == state.dateFilter,
                      onTap: () => context.read<FilterBloc>().add(FilterEventDateTime(dateTime: e)),
                    ),
                  )
                  .toList(),
            )
          ],
        );
      },
    );
  }

  Widget buildChip(String label, {bool selected = false, Function()? onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: 72,
        height: 24,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selected ? Colors.blue.shade200 : Colors.grey.shade200,
        ),
        child: Center(
          child: Text(
            label,
            textScaler: const TextScaler.linear(0.8),
          ),
        ),
      ),
    );
  }
}
