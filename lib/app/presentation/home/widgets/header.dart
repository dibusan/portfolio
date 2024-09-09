import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/state.dart';
import 'package:portfolio_eriel/app/shared/__.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderAppBar extends StatelessWidget {
  final Developer? developer;

  const HeaderAppBar({super.key, this.developer});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<FilterBloc>(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 24, bottom: 24),
              width: size.width * 0.3,
              height: 40,
              child: TextFormField(
                controller: bloc.generalController,
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade50,
                    constraints: const BoxConstraints(maxHeight: 50),
                    hintText: "Exact string search",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: state.filterGeneral.isEmpty
                        ? null
                        : IconButton(
                            onPressed: () => bloc.generalController.clear(),
                            icon: const Icon(Icons.clear),
                          )),
              ),
            ),
            const Expanded(child: SizedBox()),
            const HSp16(),
            TextButton(
                onPressed: () {},
                child: const Text("About me", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
            const HSp16(),
            InkWell(
              onTap: () {
                if (developer?.phoneNumber == null) return;
                final uri = Uri(scheme: 'tel', path: developer!.phoneNumber);
                canLaunchUrl(uri).then((bool result) async {
                  if (!result) return;
                  await launchUrl(uri);
                });
              },
              borderRadius: BorderRadius.circular(50),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.8),
                      Colors.black45,
                    ],
                  ),
                ),
                child: const Text(
                  "Contact me",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
