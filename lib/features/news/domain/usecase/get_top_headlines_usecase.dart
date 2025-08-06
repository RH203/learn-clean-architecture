import 'package:injectable/injectable.dart';
import 'package:learn_clean_archi/features/news/domain/entity/article.dart';
import 'package:learn_clean_archi/features/news/domain/repositories/news_repository.dart';

@LazySingleton()
class GetTopHeadlinesUseCase {
  final NewsRepositories newsRepository;

  const GetTopHeadlinesUseCase(this.newsRepository);

  Future<List<Article>> call() async {
    return await newsRepository.getTopHeadlines();
  }
}
