import 'package:climate_app/providers/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => WeatherProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Climate App',
      home: const HomePage(),
    );
  }
}
