import 'package:json_annotation/json_annotation.dart';
import 'package:learn_clean_archi/features/news/domain/entity/article.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  final String? sourceId;
  final String? soureName, author, title, description, url, urlToImage, content;
  final DateTime? publishedAt;

  const ArticleModel({
    required this.sourceId,
    required this.soureName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.publishedAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => {
    'publishedAt': publishedAt?.toIso8601String(),
  };

  Article toEntity() {
    return Article(
      sourceId: sourceId,
      soureName: soureName,
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      content: content,
      publishedAt: publishedAt,
    );
  }
}
