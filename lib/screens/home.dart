import 'package:climate_app/services/location.dart';
import 'package:flutter/material.dart';
import 'package:climate_app/utilities/constants.dart';
import 'package:climate_app/services/location.dart';
import 'package:climate_app/services/networking.dart';




class Home extends StatefulWidget {

  Home({super.key});



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var latitude;
  var longitude;


  weatherData() async {
    var location = await Location().determinePosition();
    latitude = location.latitude;
    longitude = location.longitude;
    var _weatherinfo =  WeatherData(url: '$kBaseURL?lat=$latitude&lon=$longitude&appid=$kApiKey');
    _weatherinfo = await _weatherinfo.getWeatherByLocation();
    print(_weatherinfo);

  }

  @override
  void initState() {
    super.initState();
    // Initialization tasks

    weatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.white70,
        child: Column(
          children: [
            Text(
              '$latitude',
              style: TextStyle(fontSize: 50),
            ),
            ElevatedButton(onPressed: (){}, child: Text('PRESS'))
          ],
        ),
      ),
    );
  }
}
