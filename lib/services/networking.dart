import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherData {
  final url;
  WeatherData({this.url});

  Future fetchWeatherDataByLocation() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Weather data 6iop[p[[[[[[');
      throw Exception('Weather Data could not be reached');

    }
  }
}
