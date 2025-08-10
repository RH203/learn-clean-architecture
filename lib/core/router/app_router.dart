import 'package:go_router/go_router.dart';
import 'package:learn_clean_archi/features/news/domain/entity/article.dart';
import 'package:learn_clean_archi/features/news/presentations/pages/detail_news_pages.dart';
import 'package:learn_clean_archi/features/news/presentations/pages/news_pages.dart';
import 'package:learn_clean_archi/features/news/presentations/widgets/list_news_widget.dart';
import 'package:learn_clean_archi/features/onboarding/presentation/pages/onboarding_pages.dart';

class AppRouter {
  const AppRouter._();

  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => OnboardingPages()),
      GoRoute(
        path: '/list-news',
        builder: (context, state) => ListNewsWidget(),
      ),
      GoRoute(path: '/news', builder: (context, state) => NewsPages()),
      GoRoute(
        path: '/detail-news',
        builder: (context, state) {
          final Article news = state.extra as Article;
          return DetailNewsPages(article: news);
        },
      ),
    ],
  );
}
