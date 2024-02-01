import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherData {
  final url;
  WeatherData({this.url});

  Future getWeatherByLocation() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
