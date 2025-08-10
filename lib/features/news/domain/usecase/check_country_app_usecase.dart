import 'package:injectable/injectable.dart';
import 'package:learn_clean_archi/features/news/domain/entity/app_country.dart';
import 'package:learn_clean_archi/features/news/domain/repositories/country_repositories.dart';

@LazySingleton()
class CheckCountryAppUsecase {
  final CountryRepositories countryRepositories;

  CheckCountryAppUsecase(this.countryRepositories);

  Future<AppCountry?> call() async {
    return countryRepositories.checkCountryApp();
  }
}
