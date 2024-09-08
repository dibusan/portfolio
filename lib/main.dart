import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/bloc.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/presentation/home/home.dart';
import 'package:portfolio_eriel/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

bool shouldUseFirestoreEmulator = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    webExperimentalAutoDetectLongPolling: false,
    webExperimentalForceLongPolling: true,
    webExperimentalLongPollingOptions: WebExperimentalLongPollingOptions(
      timeoutDuration:  Duration(seconds: 5),
    ),
  );
  if (shouldUseFirestoreEmulator) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  }

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
      title: 'Portfolio',
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
