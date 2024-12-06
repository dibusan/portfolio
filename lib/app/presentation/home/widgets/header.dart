import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/state.dart';
import 'package:portfolio_eriel/app/navigator.dart';
import 'package:portfolio_eriel/app/presentation/about_me/about_me.dart';
import 'package:portfolio_eriel/app/shared/__.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';

class HeaderAppBar extends StatelessWidget {
  final Developer? developer;

  const HeaderAppBar({super.key, this.developer});

  static pdfReport(BuildContext context) {
    return IconButton(
      onPressed: () => context.goNamed(AppRoute.resume.name),
      color: Theme.of(context).colorScheme.primary,
      icon: const Icon(Icons.picture_as_pdf_outlined),
    );
  }

  static aboutMe(BuildContext context, {Developer? developer}) {
    return TextButton(
      onPressed: developer == null ? null : () => AboutMeDialog.show(context, developer: developer),
      child: const Text(
        "About me",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  static contactMe(BuildContext context, {Developer? developer}) {
    return InkWell(
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
    );
  }

  static searchField(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<FilterBloc>(context);
        return TextFormField(
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
                  ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(child: HeaderAppBar.searchField(context)),
            const Expanded(child: SizedBox()),
            const HSp16(),
            HeaderAppBar.pdfReport(context),
            const HSp16(),
            HeaderAppBar.aboutMe(context, developer: developer),
            const HSp16(),
            HeaderAppBar.contactMe(context, developer: developer)
          ],
        );
      },
    );
  }
}
