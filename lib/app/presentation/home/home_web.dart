import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:portfolio_eriel/app/bloc/filter/bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/event.dart';
import 'package:portfolio_eriel/app/bloc/filter/state.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/presentation/home/sections/company/company_section.dart';
import 'package:portfolio_eriel/app/presentation/home/sections/personal/personal_section.dart';
import 'package:portfolio_eriel/app/presentation/home/widgets/header.dart';
import 'package:portfolio_eriel/app/presentation/home/leftBar/letf_bar.dart';
import 'package:portfolio_eriel/app/presentation/project/project.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/project_preview_card.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class HomeWebPage extends StatelessWidget {
  final Developer? developer;
  final List<Project> projects;

  const HomeWebPage({super.key, required this.developer, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(flex: 2, child: CompanySection(projects: projects.where((e) => !e.isPersonal).toList())),
        const Divider(color: Colors.white, thickness: 2),
        Expanded(flex: 1, child: PersonalSection(projects: projects.where((e) => e.isPersonal).toList()))
      ],
    );
  }
}
