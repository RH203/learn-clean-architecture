part of 'country_bloc.dart';

sealed class CountryEvent extends Equatable {
  const CountryEvent();
}

final class GetCountryApp extends CountryEvent {
  @override
  List<Object> get props => [];
}

final class CreateCountryAppEvent extends CountryEvent {
  final AppCountry country;

  const CreateCountryAppEvent(this.country);

  @override
  List<Object> get props => [country];
}
