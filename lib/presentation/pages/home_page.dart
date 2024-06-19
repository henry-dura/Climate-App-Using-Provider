import 'package:climate_app/bloc/weather_bloc.dart';
import 'package:climate_app/constants.dart';
import 'package:climate_app/presentation/UI_logic/weather_logic.dart';
import 'package:climate_app/presentation/components/searchCity_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../../data/services/location.dart';
import '../components/city_details_widgets.dart';
import 'package:intl/intl.dart';
import '../components/data_widget.dart';
import '../components/spinner.dart';
import 'package:weather_icons/weather_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WeatherBloc weatherBloc;


  _getCurrentLocationDetails() async {
    Position locationData = await Location.determinePosition();
    weatherBloc.add(WeatherByLocationEvent(
        lat: locationData.latitude, lon: locationData.longitude));
  }

  @override
  void initState() {
    super.initState();
    // Initialization tasks
    weatherBloc = BlocProvider.of<WeatherBloc>(context);
    _getCurrentLocationDetails();
  }



  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    // Format the date as a string
    String formattedDate = DateFormat('EEEE, d MMM, yyyy').format(currentDate);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoadingState) {
                return const Spinner();
              } else if (state is WeatherLoadSuccessState) {
                final data = state.weatherModel;
                return ListView(
                  children: [
                    const SearchCityTextField(),
                    const SizedBox(
                      height: 20,
                    ),
                    CityDetailsWidgets(
                      formattedDate: formattedDate,
                      city: '${data.city}',
                      country: '${data.location}',
                    ),
                    kSpace,
                    Center(
                      child: Text(
                        WeatherLogic.getWeatherIcon(data.condition),
                        style: const TextStyle(fontSize: 90),
                      ),
                    ),
                    Center(
                      child: Text(
                        '${data.temp}\u00B0C',
                        style: const TextStyle(
                            fontSize: 90, fontWeight: FontWeight.w900),
                      ),
                    ),
                    kSpace,
                    Text(
                      WeatherLogic.getMessage(data.temp),
                      style: const TextStyle(
                          fontSize: 60, color: Colors.indigoAccent),
                      textAlign: TextAlign.center,
                    ),
                    kSpace,
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: kBlackContainerDecoration,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DataWidget(
                              iconName:  WeatherIcons.windy,
                              value: '${data.windSpeed} ',
                              name: 'Wind Speed',
                              unit: 'm/s',
                            ),
                            DataWidget(
                              iconName: WeatherIcons.humidity,
                              value: '${data.humidity} ',
                              name: 'Humidity',
                              unit: 'grams/m3',
                            ),
                            DataWidget(
                              iconName: WeatherIcons.barometer,
                              value: '${data.pressure} ',
                              name: 'Pressure',
                              unit: 'Pa',
                            ),
                          ],
                        )),
                  ],
                );
              } else if (state is WeatherLoadErrorState) {
                return Text(state.errorMessage);
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}

