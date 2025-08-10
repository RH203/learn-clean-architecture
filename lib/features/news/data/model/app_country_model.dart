import 'package:learn_clean_archi/features/news/domain/entity/app_country.dart';

class AppCountryModel {
  final String? countryCode, countryName;

  const AppCountryModel({required this.countryCode, required this.countryName});

  AppCountry toEntity() {
    return AppCountry(countryCode: countryCode, countryName: countryName);
  }
}
