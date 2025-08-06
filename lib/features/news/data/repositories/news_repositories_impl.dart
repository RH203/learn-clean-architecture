import 'package:injectable/injectable.dart';
import 'package:learn_clean_archi/features/news/data/datasources/remote/news_data_source.dart';
import 'package:learn_clean_archi/features/news/domain/entity/article.dart';
import 'package:learn_clean_archi/features/news/domain/repositories/news_repository.dart';

@LazySingleton(as: NewsRepositories)
class NewsRepositoriesImpl implements NewsRepositories {
  final NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoriesImpl(this.newsRemoteDataSource);

  @override
  Future<List<Article>> getTopHeadlines()async{
    final model = await newsRemoteDataSource.getTopHeadlines();
    return model.map((e) => e.toEntity()).toList();
  }
}