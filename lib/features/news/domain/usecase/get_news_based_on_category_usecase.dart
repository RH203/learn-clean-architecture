import 'package:injectable/injectable.dart';
import 'package:learn_clean_archi/features/news/domain/entity/article.dart';
import 'package:learn_clean_archi/features/news/domain/repositories/news_repositories.dart';

@LazySingleton()
class GetNewsBasedOnCategoryUsecase {
  final NewsRepositories newsRepositories;

  GetNewsBasedOnCategoryUsecase(this.newsRepositories);

  Future<List<Article>?> call(String category, String? countryCode) async {
    return newsRepositories.getNewsBasedOnCategory(category, countryCode);
  }
}
