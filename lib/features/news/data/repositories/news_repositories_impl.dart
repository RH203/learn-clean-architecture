import 'package:injectable/injectable.dart';
import 'package:learn_clean_archi/features/news/data/datasources/remote/news_data_source.dart';
import 'package:learn_clean_archi/features/news/domain/entity/article.dart';
import 'package:learn_clean_archi/features/news/domain/repositories/news_repositories.dart';

@LazySingleton(as: NewsRepositories)
class NewsRepositoriesImpl implements NewsRepositories {
  final NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoriesImpl(this.newsRemoteDataSource);

  @override
  Future<List<Article>> getTopHeadlines(String? countryCode) async {
    final model = await newsRemoteDataSource.getTopHeadlines(countryCode);
    return model.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<Article>?> getNewsBasedOnCategory(
    String category,
    String? countryCode,
  ) async {
    final model = await newsRemoteDataSource.getNewsBasedOnCategory(
      category,
      countryCode,
    );

    if (model == null) return null;
    return model.map((e) => e.toEntity()).toList();
  }
}
