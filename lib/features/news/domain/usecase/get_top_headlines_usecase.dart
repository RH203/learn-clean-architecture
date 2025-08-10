import 'package:injectable/injectable.dart';
import 'package:learn_clean_archi/features/news/domain/entity/article.dart';
import 'package:learn_clean_archi/features/news/domain/repositories/news_repositories.dart';

@LazySingleton()
class GetTopHeadlinesUseCase {
  final NewsRepositories newsRepository;

  const GetTopHeadlinesUseCase(this.newsRepository);

  Future<List<Article>> call(String? countryCode) async {
    return await newsRepository.getTopHeadlines(countryCode);
  }
}
