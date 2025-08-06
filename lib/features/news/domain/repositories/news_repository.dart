import 'package:injectable/injectable.dart';
import 'package:learn_clean_archi/features/news/domain/entity/article.dart';

abstract class NewsRepositories{
  Future<List<Article>> getTopHeadlines();
}