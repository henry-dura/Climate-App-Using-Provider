import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:climate_app/models/weather_model.dart';

import '../services/location.dart';
import '../services/networking.dart';
import '../utilities/constants.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherInfo;
  bool _isLoading = false;
  var _searchedCity;

  WeatherModel? get weatherInfo => _weatherInfo;
  bool get isLoading => _isLoading;
  String get searchedCity => _searchedCity;

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void enteredCity(String city){
    _searchedCity = city;
    notifyListeners();
  }

  void setWeatherData() async {
    // to make the spinner start turning
    _setLoading(true);

    var location = await Location
        .determinePosition(); // get location longitude and latitude

    WeatherData fetchWeatherData;
    int x = 7;
    if(_searchedCity != null){
      fetchWeatherData = WeatherData(
          url:
          '$kBaseURL?q=$_searchedCity&appid=$kApiKey&units=metric');
    }else{
      fetchWeatherData = WeatherData(
          url:
          '$kBaseURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric');


    }

    var returnedData = await fetchWeatherData.fetchWeatherDataByLocation(); // data returned from open weather map

    try {
      _weatherInfo = WeatherModel(
        currentTemperature: returnedData['main']['temp'],
        minTemperature:returnedData['main']['temp_min'] ,
        maxTemperature: returnedData['main']['temp_max'],
        location: returnedData['sys']['country'],
        city: returnedData['name'],
        humidity: returnedData['main']['humidity'],
        windSpeed: returnedData['wind']['speed'],
        pressure: returnedData['main']['pressure'],
        condition: returnedData['weather'][0]['id']
      );
      notifyListeners();
    } catch (e) {
      // _setLoading(false);
      print('The looked of reference do not exist in response: $e');
    } finally {
      _setLoading(!isLoading); // stop the spinner
    }
  }
}
