import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_clean_archi/app_logger.dart';
import 'package:learn_clean_archi/features/news/data/model/article_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<ArticleModel>> getTopHeadlines(String? countryCode);

  Future<List<ArticleModel>?> getNewsBasedOnCategory(
    String category,
    String? countryCode,
  );
}

@LazySingleton(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;

  NewsRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ArticleModel>> getTopHeadlines(String? countryCode) async {
    final response = await dio.get(
      '/top-headlines',
      queryParameters: {
        'country': countryCode?.toLowerCase(),
        'pageSize': '30',
      },
    );

    final articles = response.data['articles'] as List;

    return articles.map((e) => ArticleModel.fromJson(e)).toList();
  }

  Future<List<ArticleModel>?> getNewsBasedOnCategory(
    String category,
    String? countryCode,
  ) async {
    final response;

    if (category != 'top headlines') {
      response = await dio.get(
        '/top-headlines',
        queryParameters: {
          'country': countryCode?.toLowerCase(),
          'category': category,
          'pageSize': '30',
        },
      );
    } else {
      response = await dio.get(
        '/top-headlines',
        queryParameters: {
          'country': countryCode?.toLowerCase(),
          'pageSize': '30',
        },
      );
    }

    final data = response.data;
    AppLogger.debug(data);

    if (data == null || data['articles'] == null) {
      return [];
    }
    final articles = data['articles'] as List;
    return articles.map((e) => ArticleModel.fromJson(e)).toList();
  }
}
