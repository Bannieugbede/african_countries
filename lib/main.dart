import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/country_bloc.dart';
import 'repository/country_repository.dart';
import 'screens/country_list_screen.dart';
import 'services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();
    final countryRepository = CountryRepository(apiService);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'African Countries',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => CountryBloc(countryRepository),
        child: CountryListScreen(),
      ),
    );
  }
}
