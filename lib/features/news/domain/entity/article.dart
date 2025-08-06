import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String? sourceId;
  final String? soureName, author, title, description, url, urlToImage, content;
  final DateTime? publishedAt;

  const Article({
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

  @override
  List<Object?> get props => [
    sourceId,
    soureName,
    author,
    title,
    description,
    url,
    urlToImage,
    content,
    publishedAt,
  ];
}
