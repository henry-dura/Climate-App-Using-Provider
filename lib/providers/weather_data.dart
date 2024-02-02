import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:climate_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _weatherInfo;
  WeatherModel? get weatherInfo => _weatherInfo;

  void setWeatherData( WeatherModel weatherInfo){
    _weatherInfo = weatherInfo;
    notifyListeners();

  }

}