import 'package:climate_app/models/weather_model.dart';
import 'package:climate_app/providers/weather_data.dart';
import 'package:climate_app/screens/home_page.dart';
import 'package:climate_app/services/location.dart';
import 'package:flutter/material.dart';
import 'package:climate_app/utilities/constants.dart';
import 'package:climate_app/services/location.dart';
import 'package:climate_app/services/networking.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    // Initialization tasks



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SpinKitWaveSpinner(
      color: Colors.green,
      size: 100.0,
    ),
        ));
  }

  // void _getWeatherData() async {
  //   final weatherProvider =
  //       Provider.of<WeatherProvider>(context, listen: false);
  //   var location = await Location.determinePosition();
  //   WeatherData fetchWeatherData = WeatherData(
  //       url:
  //           '$kBaseURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey');
  //   var returnedData = await fetchWeatherData.fetchWeatherDataByLocation();
  //   try {
  //     final weatherModel = WeatherModel(
  //         temp: returnedData['main']['temp'],
  //         location: returnedData['sys']['country']);
  //     //Update WeatherProvider
  //     weatherProvider.setWeatherData(weatherModel);
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const HomePage()),
  //     );
  //   } catch (e) {
  //     print('The looked of reference do not exist in response: $e');
  //   }
  // }
}
