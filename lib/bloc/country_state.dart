import 'package:equatable/equatable.dart';
import '../models/country.dart';
import '../models/country_detail.dart';

abstract class CountryState extends Equatable {
  @override
  List<Object> get props => [];
}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountriesLoaded extends CountryState {
  final List<Country> countries;
  CountriesLoaded(this.countries);
}

class CountryDetailLoaded extends CountryState {
  final CountryDetail countryDetail;
  CountryDetailLoaded(this.countryDetail);
}

class CountryError extends CountryState {
  final String message;
  CountryError(this.message);
}
