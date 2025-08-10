import 'package:learn_clean_archi/features/news/domain/entity/article.dart';

abstract class NewsRepositories {
  Future<List<Article>> getTopHeadlines(String? countryCode);

  Future<List<Article>?> getNewsBasedOnCategory(
    String category,
    String? countryCode,
  );
}
