import 'package:injectable/injectable.dart';
import 'package:learn_clean_archi/features/news/domain/entity/app_country.dart';
import 'package:learn_clean_archi/features/news/domain/repositories/country_repositories.dart';

@LazySingleton()
class CreateCountryAppUsecase {
  final CountryRepositories countryRepositories;

  CreateCountryAppUsecase(this.countryRepositories);

  AppCountry? call(String? country) {
    return countryRepositories.createCountryApp(country!);
  }
}
