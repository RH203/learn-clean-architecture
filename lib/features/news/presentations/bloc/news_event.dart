part of 'news_bloc.dart';

sealed class NewsEvent {
  const NewsEvent();
}

final class FetchTopHeadlinesNews extends NewsEvent{}