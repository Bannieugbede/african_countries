class Country {
  final String name;
  final Map<String, String> languages;
  final List<String> capital;
  final Map<String, String> flags;

  Country({
    required this.name,
    required this.languages,
    required this.capital,
    required this.flags,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'],
      languages: Map<String, String>.from(json['languages'] ?? {}),
      capital: List<String>.from(json['capital'] ?? []),
      flags: Map<String, String>.from(json['flags'] ?? {}),
    );
  }
}
