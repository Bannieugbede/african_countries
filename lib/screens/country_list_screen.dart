import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/country_bloc.dart';
import '../bloc/country_event.dart';
import '../bloc/country_state.dart';
import 'country_detail_screen.dart';

class CountryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('African Countries'),
        backgroundColor: Colors.green[700],
      ),
      body: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          if (state is CountryInitial) {
            context.read<CountryBloc>().add(FetchCountries());
            return Center(child: CircularProgressIndicator());
          }
          if (state is CountryLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CountriesLoaded) {
            return ListView.builder(
              itemCount: state.countries.length,
              itemBuilder: (context, index) {
                final country = state.countries[index];
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Image.network(
                      country.flags['png'] ?? '',
                      width: 50,
                      errorBuilder: (_, __, ___) => Icon(Icons.error),
                    ),
                    title: Text(country.name),
                    subtitle: Text(country.capital.isNotEmpty ? country.capital[0] : 'No capital'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.read<CountryBloc>(), // Pass the existing CountryBloc instance
                            child: CountryDetailScreen(countryName: country.name),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
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
}