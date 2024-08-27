import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/bloc.dart';
import 'package:portfolio_eriel/app/bloc/event.dart';
import 'package:portfolio_eriel/app/bloc/state.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

import 'package:portfolio_eriel/app/shared/__.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FilterBloc()..add(const FilterEventInit()),
      child: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(1, 235, 239, 242),
            body: Row(
              children: [
                Container(
                  width: 330,
                  margin: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 8),
                  child: const FilteringSection(),
                ),
                Expanded(
                  child: Wrap(
                    children: [
                      Column(
                        children: [
                          const Center(
                            child: TopBar(),
                          ),
                          Text('Total Projects: ${state.projects.length}'),
                          Row(
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxHeight: MediaQuery.sizeOf(context).height,
                                  maxWidth: MediaQuery.sizeOf(context).width / 2,
                                ),
                                child: ProjectsGrid(projects: state.projects),
                              ),
                              const Expanded(
                                child: ProjectDetails(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
