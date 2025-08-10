part of 'country_bloc.dart';

sealed class CountryState extends Equatable {
  const CountryState();
}

final class CountryInitial extends CountryState {
  @override
  List<Object> get props => [];
}

final class CountryLoaded extends CountryState {
  final AppCountry country;

  const CountryLoaded(this.country);

  @override
  List<Object> get props => [country];
}

final class CountryError extends CountryState {
  final String message;

  const CountryError(this.message);

  @override
  List<Object> get props => [message];
}
