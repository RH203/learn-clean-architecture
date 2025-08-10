import 'package:equatable/equatable.dart';

class AppCountry extends Equatable {
  final String? countryCode, countryName;

  const AppCountry({required this.countryCode, required this.countryName});

  @override
  List<Object?> get props => [countryCode, countryName];
}
