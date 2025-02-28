import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/country_bloc.dart';
import '../bloc/country_event.dart';
import '../bloc/country_state.dart';

class CountryDetailScreen extends StatelessWidget {
  final String countryName;

  CountryDetailScreen({required this.countryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(countryName,style: TextStyle(color: Colors.white,),),
        backgroundColor: Colors.green[700],
      ),
      body: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          if (state is CountryInitial || state is CountriesLoaded) {
            context.read<CountryBloc>().add(FetchCountryDetail(countryName));
            return Center(child: CircularProgressIndicator());
          }
          if (state is CountryLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CountryDetailLoaded) {
            final country = state.countryDetail;
            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      country.flags['png'] ?? '',
                      height: 150,
                      errorBuilder: (_, __, ___) => Icon(Icons.error, size: 150),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildInfoCard('Capital', country.capital.join(', ')),
                  _buildInfoCard('Population', country.population.toString()),
                  _buildInfoCard('Region', country.region),
                  _buildInfoCard(
                    'Languages',
                    country.languages.values.join(', '),
                  ),
                ],
              ),
            );
          }
          if (state is CountryError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}