
import 'weather_model.dart';
import 'weather_Api_provider.dart';

class WeatherRepository{
  final WeatherApiProvider weatherApiProvider;

  WeatherRepository({required this.weatherApiProvider});

  Future<WeatherModel> getWeatherByCity(String city) async {
    return await weatherApiProvider.fetchWeatherByCity(city);
  }

  Future<WeatherModel> getWeatherByLocation(double lat, double lon) async {
    return await weatherApiProvider.fetchWeatherByLocation(lat,lon);
  }


}