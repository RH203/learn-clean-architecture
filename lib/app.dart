import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_clean_archi/core/injectable/injectable.dart';
import 'package:learn_clean_archi/core/router/app_router.dart';
import 'package:learn_clean_archi/features/news/presentations/bloc/country/country_bloc.dart';
import 'package:learn_clean_archi/features/news/presentations/bloc/news/news_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<NewsBloc>()),
        BlocProvider(create: (context) => getIt<CountryBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        title: 'News App',
        theme: ThemeData(
          colorSchemeSeed: Colors.red,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
    );
  }
}
