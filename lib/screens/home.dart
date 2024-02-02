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

  weatherData() async {
    var location = await Location().determinePosition();
    double latitude = location.latitude;
    double longitude = location.longitude;
    WeatherData getData =  WeatherData(url: '$kBaseURL?lat=$latitude&lon=$longitude&appid=$kApiKey');
    var returnedData = await getData.getWeatherByLocation();
    var temp =returnedData['weather'][0]['main'];
    print(temp);


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
              'Good',
              style: TextStyle(fontSize: 50),
            ),
            ElevatedButton(onPressed: (){}, child: Text('PRESS'))
          ],
        ),
      ),
    );
  }
}
