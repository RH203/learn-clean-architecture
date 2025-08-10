import 'package:country_picker/country_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_clean_archi/features/news/data/model/app_country_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CountryDataSource {
  Future<AppCountryModel?> checkCountryApp();

  AppCountryModel? createCountryApp(String country);
}

@LazySingleton(as: CountryDataSource)
class CountryDataSourceImpl implements CountryDataSource {
  final SharedPreferences pref;

  CountryDataSourceImpl(this.pref);

  @override
  Future<AppCountryModel?> checkCountryApp() async {
    String? countryCode = pref.getString('countryCode');

    if (countryCode == null) return null;

    Country? country = Country.tryParse(countryCode);

    if (country == null) return null;

    return AppCountryModel(countryCode: countryCode, countryName: country.name);
  }

  @override
  AppCountryModel? createCountryApp(String country) {
    Country? countryCodeAndName = Country.tryParse(country);

    if (countryCodeAndName == null) return null;

    String? countryCode = countryCodeAndName.countryCode;
    String? countryName = countryCodeAndName.name;

    pref.setString("countryCode", countryCodeAndName.countryCode);

    return AppCountryModel(countryCode: countryCode, countryName: countryName);
  }
}
