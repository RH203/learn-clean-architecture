import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_clean_archi/app_logger.dart';
import 'package:learn_clean_archi/features/news/domain/entity/app_country.dart';
import 'package:learn_clean_archi/features/news/domain/usecase/check_country_app_usecase.dart';
import 'package:learn_clean_archi/features/news/domain/usecase/create_country_app_usecase.dart';

part 'country_event.dart';
part 'country_state.dart';

@injectable
class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CheckCountryAppUsecase checkCountryApp;
  final CreateCountryAppUsecase createCountryApp;

  CountryBloc(this.checkCountryApp, this.createCountryApp)
    : super(CountryInitial()) {
    on<GetCountryApp>(_getCountryApp);
    on<CreateCountryAppEvent>(_createCountryApp);
  }

  Future<void> _getCountryApp(
    GetCountryApp event,
    Emitter<CountryState> emit,
  ) async {
    AppCountry? countryApp = await checkCountryApp.call();
    if (countryApp == null) {
      emit(CountryError("Country app tidak ada"));
      return;
    }
    AppLogger.debug("from create get country app $countryApp");

    emit(CountryLoaded(countryApp));
  }

  void _createCountryApp(
    CreateCountryAppEvent event,
    Emitter<CountryState> emit,
  ) {
    AppLogger.debug("from create country app event $event.country.countryName");

    AppCountry? country = createCountryApp.call(event.country.countryCode);

    if (country == null) {
      emit(CountryError("Null"));
      return;
    }
    AppLogger.debug("from create country app $country");
    emit(CountryLoaded(country));
  }
}
