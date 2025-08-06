import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:learn_clean_archi/app.dart';
import 'package:learn_clean_archi/app_bloc_observer.dart';
import 'package:learn_clean_archi/core/injectable/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = const AppBlocObserver();

  await configureDependencies();

  runApp(const App());
}
