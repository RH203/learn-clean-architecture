import 'package:go_router/go_router.dart';
import 'package:learn_clean_archi/features/news/presentations/pages/list_news_pages.dart';
import 'package:learn_clean_archi/features/onboarding/presentation/pages/onboarding_pages.dart';

class AppRouter {
  const AppRouter._();

  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => OnboardingPages(),
      ),
      GoRoute(
        path: '/list-news',
        builder: (context, state) => ListNewsPages(),
      ),
    ],
  );
}
