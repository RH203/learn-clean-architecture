import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_clean_archi/core/injectable/injectable.dart';
import 'package:learn_clean_archi/features/news/data/model/article_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<ArticleModel>> getTopHeadlines();
}

@LazySingleton(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;

  NewsRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ArticleModel>> getTopHeadlines() async {
    final response = await dio.get(
      '/top-headlines',
      queryParameters: {'country': 'us'},
    );

    final articles = response.data['articles'] as List;
    return articles.map((e) => ArticleModel.fromJson(e)).toList();
  }
}
