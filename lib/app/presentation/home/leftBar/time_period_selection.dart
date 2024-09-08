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
            const Text(
              "Time period selection",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
            ),
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
      child: Card(
          elevation: selected ? 5 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: selected ? Colors.white : Colors.grey.shade200,
          margin: const EdgeInsets.all(2),
          child: SizedBox(
            width: 72,
            height: 24,
            child: Center(
              child: Text(
                label,
                textScaler: const TextScaler.linear(0.8),
              ),
            ),
          )),
    );
  }
}
