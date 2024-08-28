import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/state.dart';
import 'package:portfolio_eriel/app/shared/__.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<FilterBloc>(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(top: 24, bottom: 24),
                width: 400,
                height: 40,
                child: SearchBar(
                  controller: bloc.generalController,
                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                  elevation: const WidgetStatePropertyAll(1),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.black, width: 0.2),
                    ),
                  ),
                  constraints: const BoxConstraints(maxHeight: 50),
                  hintText: "Exact string search",
                  leading: const Icon(Icons.search),
                  trailing: [
                    if (state.filterGeneral.isNotEmpty)
                      IconButton(
                        onPressed: () => bloc.generalController.clear(),
                        icon: const Icon(Icons.clear),
                      )
                  ],
                ),
              ),
            ),
            const HSp16(),
            Flexible(child: buildContactChip("erieljr1@gmail.com", Icons.email_outlined)),
            const HSp16(),
            Flexible(child: buildContactChip("+1 786 428 8315", Icons.phone_outlined)),
          ],
        );
      },
    );
  }

  Widget buildContactChip(
    String text,
    IconData icon,
  ) {
    return SizedBox(
      width: 240,
      height: 50,
      child: Card(
        elevation: 1,
        color: Colors.white,
        child: Center(
          child: ListTile(
            trailing: Icon(icon),
            title: Text(
              text,
              overflow: TextOverflow.ellipsis,
            ),
            // dense: true,
          ),
        ),
      ),
    );
  }
}
