import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> fetchCountries() async {
  final response = await http.get(Uri.parse('https://restcountries.com/v3.1/region/asia'));

  if (response.statusCode == 200) {
    List<dynamic> countriesJson = json.decode(response.body);
    return countriesJson
        .map((country) => country['name']['common'] as String)
        .toList()
      ..sort(); // optional: sort alphabetically
  } else {
    throw Exception('Failed to load countries');
  }
}