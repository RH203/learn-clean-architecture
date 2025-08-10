import 'package:injectable/injectable.dart';
import 'package:learn_clean_archi/app_logger.dart';
import 'package:learn_clean_archi/features/news/data/datasources/local/country_data_source.dart';
import 'package:learn_clean_archi/features/news/data/model/app_country_model.dart';
import 'package:learn_clean_archi/features/news/domain/entity/app_country.dart';
import 'package:learn_clean_archi/features/news/domain/repositories/country_repositories.dart';

@LazySingleton(as: CountryRepositories)
class CountryRepositoriesImpl implements CountryRepositories {
  final CountryDataSource countryDataSource;

  CountryRepositoriesImpl(this.countryDataSource);

  @override
  Future<AppCountry?> checkCountryApp() async {
    AppCountryModel? countryModel = await countryDataSource.checkCountryApp();

    if (countryModel == null) return null;

    return countryModel.toEntity();
  }

  @override
  AppCountry? createCountryApp(String country) {
    AppLogger.debug('from repositories impl start $country');
    AppCountryModel? countryModel = countryDataSource.createCountryApp(country);

    if (countryModel == null) return null;
    AppLogger.debug('from repositories impl end $countryModel');

    return countryModel.toEntity();
  }
}
