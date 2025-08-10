import 'package:learn_clean_archi/features/news/domain/entity/app_country.dart';

abstract class CountryRepositories {
  Future<AppCountry?> checkCountryApp();

  AppCountry? createCountryApp(String country);
}
