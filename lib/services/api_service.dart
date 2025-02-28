import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country.dart';
import '../models/country_detail.dart';

class ApiService {
  final String baseUrl = 'https://restcountries.com/v3.1';

  Future<List<Country>> fetchAfricanCountries() async {
    final response = await http.get(Uri.parse(
        '$baseUrl/region/africa?status=true&fields=name,languages,capital,flags'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<CountryDetail> fetchCountryDetails(String name) async {
    final response = await http.get(Uri.parse('$baseUrl/name/$name'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return CountryDetail.fromJson(data[0]);
    } else {
      throw Exception('Failed to load country details');
    }
  }
}
