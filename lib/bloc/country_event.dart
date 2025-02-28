import 'package:equatable/equatable.dart';

abstract class CountryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCountries extends CountryEvent {}

class FetchCountryDetail extends CountryEvent {
  final String countryName;
  FetchCountryDetail(this.countryName);
}
