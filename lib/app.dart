import 'package:flutter/material.dart';
import 'package:learn_clean_archi/core/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      title: 'News App',
      theme: ThemeData(colorSchemeSeed: Colors.red),
    );
  }
}
