import '../models/country.dart';
import '../models/country_detail.dart';
import '../services/api_service.dart';

class CountryRepository {
  final ApiService apiService;

  CountryRepository(this.apiService);

  Future<List<Country>> fetchAfricanCountries() =>
      apiService.fetchAfricanCountries();
  Future<CountryDetail> fetchCountryDetails(String name) =>
      apiService.fetchCountryDetails(name);
}
