import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/bloc.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/presentation/home/home.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => ProjectBloc()..add(const ProjectEventStarted())),
    BlocProvider(create: (_) => FilterBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
