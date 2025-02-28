class CountryDetail {
  final String name;
  final Map<String, String> languages;
  final List<String> capital;
  final Map<String, String> flags;
  final int population;
  final String region;

  CountryDetail({
    required this.name,
    required this.languages,
    required this.capital,
    required this.flags,
    required this.population,
    required this.region,
  });

  factory CountryDetail.fromJson(Map<String, dynamic> json) {
    return CountryDetail(
      name: json['name']['common'],
      languages: Map<String, String>.from(json['languages'] ?? {}),
      capital: List<String>.from(json['capital'] ?? []),
      flags: Map<String, String>.from(json['flags'] ?? {}),
      population: json['population'] ?? 0,
      region: json['region'] ?? '',
    );
  }
}
