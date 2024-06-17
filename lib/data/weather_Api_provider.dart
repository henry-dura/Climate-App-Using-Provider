import 'dart:convert';
import 'package:http/http.dart' as http;

import 'weather_model.dart';
import '../constants.dart';

class WeatherApiProvider{


  Future<WeatherModel> fetchWeatherByCity(String city) async {
    final response = await http.get(
      Uri.parse('$kBaseURL?q=$city&appid=$kApiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }


  Future<WeatherModel> fetchWeatherByLocation(double lat, double lon) async {
    final response = await http.get(
      Uri.parse('$kBaseURL?lat=$lat&lon=$lon&appid=$kApiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }

}