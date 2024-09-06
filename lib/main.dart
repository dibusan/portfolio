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
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff004E7B),
            secondary: const Color(0xffE33C3C),
            primary: const Color(0xff6694AF),
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white.withOpacity(0.3),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white, width: 2),
            ),
            hoverColor: Colors.transparent,
            isDense: true,
          )),
      home: const HomePage(),
    );
  }
}
