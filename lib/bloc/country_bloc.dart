import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/country_repository.dart';
import 'country_event.dart';
import 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryRepository repository;

  CountryBloc(this.repository) : super(CountryInitial()) {
    on<FetchCountries>(_onFetchCountries);
    on<FetchCountryDetail>(_onFetchCountryDetail);
  }

  Future<void> _onFetchCountries(
      FetchCountries event, Emitter<CountryState> emit) async {
    emit(CountryLoading());
    try {
      final countries = await repository.fetchAfricanCountries();
      emit(CountriesLoaded(countries));
    } catch (e) {
      emit(CountryError(e.toString()));
    }
  }

  Future<void> _onFetchCountryDetail(
      FetchCountryDetail event, Emitter<CountryState> emit) async {
    emit(CountryLoading());
    try {
      final countryDetail =
          await repository.fetchCountryDetails(event.countryName);
      emit(CountryDetailLoaded(countryDetail));
    } catch (e) {
      emit(CountryError(e.toString()));
    }
  }
}
