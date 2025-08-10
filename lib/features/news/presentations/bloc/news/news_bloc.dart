import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_clean_archi/features/news/domain/entity/app_country.dart';
import 'package:learn_clean_archi/features/news/domain/entity/article.dart';
import 'package:learn_clean_archi/features/news/domain/usecase/check_country_app_usecase.dart';
import 'package:learn_clean_archi/features/news/domain/usecase/get_news_based_on_category_usecase.dart';
import 'package:learn_clean_archi/features/news/domain/usecase/get_top_headlines_usecase.dart';

part 'news_event.dart';
part 'news_state.dart';

@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetTopHeadlinesUseCase getTopHeadlinesUseCase;
  final CheckCountryAppUsecase checkCountryApp;
  final GetNewsBasedOnCategoryUsecase getNewsBasedOnCategoryUsecase;

  NewsBloc(
    this.getTopHeadlinesUseCase,
    this.checkCountryApp,
    this.getNewsBasedOnCategoryUsecase,
  ) : super(NewsInitial()) {
    on<FetchTopHeadlinesNews>(_getTopHeadlines);
    on<GetNewsBasedOnCategoryEvent>(_getNewsBasedOnCategory);
  }

  Future<void> _getTopHeadlines(
    FetchTopHeadlinesNews event,
    Emitter<NewsState> emit,
  ) async {
    emit(NewsLoading());

    AppCountry? country = await checkCountryApp.call();

    if (country == null) {
      emit(NewsError("Country tidak ditemukan"));
      return;
    }

    try {
      final articles = await getTopHeadlinesUseCase.call(country.countryCode);
      if (articles.isEmpty) {
        emit(NewsError("Berita tidak ditemukan"));
        return;
      }
      emit(NewsLoaded(articles));
    } catch (e) {
      emit(NewsError('Failed to load news: ${e.toString()}'));
    }
  }

  Future<void> _getNewsBasedOnCategory(
    GetNewsBasedOnCategoryEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(NewsLoading());

    final articles = await getNewsBasedOnCategoryUsecase.call(
      event.category,
      event.countryCode?.toLowerCase(),
    );

    if (articles!.isEmpty) {
      emit(
        NewsError("Tidak ditemukan berita dengan category ${event.category}"),
      );
      return;
    }

    emit(NewsLoaded(articles));
  }
}
