import 'package:climate_app/models/weather_model.dart';
import 'package:climate_app/providers/weather_data.dart';
import 'package:climate_app/services/location.dart';
import 'package:flutter/material.dart';
import 'package:climate_app/utilities/constants.dart';
import 'package:climate_app/services/location.dart';
import 'package:climate_app/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    // Initialization tasks
    Provider.of<WeatherProvider>(context,listen:false ).setWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
      if (weatherProvider.isLoading) {
        return const Scaffold(
            body: Center(
          child: SpinKitWaveSpinner(
            color: Colors.green,
            size: 100.0,
          ),
        ));
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text('HomePage'),
          ),
          body: Column(
            children: [
              Text(
                'Temp: ${weatherProvider.weatherInfo?.temp}',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'Location: ${weatherProvider.weatherInfo?.location}',
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
        );
      }
    });
  }
}
