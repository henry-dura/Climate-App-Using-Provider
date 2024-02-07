import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:climate_app/models/weather_model.dart';

import '../services/location.dart';
import '../services/networking.dart';
import '../utilities/constants.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherInfo;
  bool _isLoading = false;

  WeatherModel? get weatherInfo => _weatherInfo;
  bool get isLoading => _isLoading;

  void _setLoading(bool loading){
    _isLoading = loading;
    notifyListeners();
  }



  void setWeatherData() async {
    // to make the spinner start turning
    _setLoading(true);

    var location = await Location.determinePosition(); // get location longitude and latitude
    WeatherData fetchWeatherData = WeatherData(
        url:
            '$kBaseURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey');
    var returnedData = await fetchWeatherData.fetchWeatherDataByLocation(); // data returned from open weather map

    try {
      _weatherInfo = WeatherModel(
        temp: returnedData['main']['temp'],
        location: returnedData['sys']['country'],
      );

      notifyListeners();

    } catch (e) {
      print('The looked of reference do not exist in response: $e');
    }finally{
      _setLoading(false); // stop the spinner
    }
  }


}
