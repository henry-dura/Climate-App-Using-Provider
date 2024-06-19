import 'package:climate_app/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchCityTextField extends StatefulWidget {
  const SearchCityTextField({super.key});

  @override
  State<SearchCityTextField> createState() => _SearchCityTextFieldState();
}

class _SearchCityTextFieldState extends State<SearchCityTextField> {

  final _cityController = TextEditingController();

  @override
  void dispose() {
    // Dispose the time controller
    super.dispose();
    _cityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return TextField(
      controller: _cityController,
      cursorHeight: 25,
      style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: Colors.white70),
      decoration: InputDecoration(
          hintText: 'Search City',
          hintStyle: const TextStyle(color: Colors.white70),
          prefixIcon: const Icon(
            Icons.search,
            size: 45,
            color: Colors.white70,
          ),
          suffixIcon: InkWell(
            splashColor: Colors.red, // Bright yellow splash color
            // borderRadius: BorderRadius.circular(50.0),

            onTap: (){
              weatherBloc.add(WeatherByCityEvent(_cityController.text));
            },
            child: const Icon(
              Icons.arrow_forward_sharp,
              color: Colors.white,
              size: 50,
            ),
          ),
          filled: true,
          fillColor: Colors.black87,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none)),
      onSubmitted: (city) {
        weatherBloc.add(WeatherByCityEvent(_cityController.text));
      },
    );
  }
}
