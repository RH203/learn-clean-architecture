part of 'news_bloc.dart';

sealed class NewsEvent {
  const NewsEvent();
}

final class FetchTopHeadlinesNews extends NewsEvent {}

final class GetNewsBasedOnCategoryEvent extends NewsEvent {
  final String category;
  final String? countryCode;

  GetNewsBasedOnCategoryEvent(this.category, this.countryCode);
}
