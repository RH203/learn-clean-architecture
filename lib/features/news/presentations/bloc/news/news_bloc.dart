import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_clean_archi/features/news/domain/entity/article.dart';
import 'package:learn_clean_archi/features/news/domain/repositories/news_repository.dart';
import 'package:learn_clean_archi/features/news/domain/usecase/get_top_headlines_usecase.dart';

part 'news_event.dart';
part 'news_state.dart';

@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetTopHeadlinesUseCase getTopHeadlinesUseCase;

  NewsBloc(this.getTopHeadlinesUseCase) : super(NewsInitial()) {
    on<FetchTopHeadlinesNews>(_getTopHeadlines);
  }

  Future<void> _getTopHeadlines (NewsEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoading());

    try {
      final articles = await getTopHeadlinesUseCase.call();
      emit(NewsLoaded(articles));
    } catch (e) {
      emit(NewsError('Failed to load news: ${e.toString()}'));
    }
  }
}
