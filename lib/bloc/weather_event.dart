part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}


class WeatherByCityEvent extends WeatherEvent{
  final String cityName;

  WeatherByCityEvent(this.cityName);
}


class WeatherByLocationEvent extends WeatherEvent{
  final double lat;
  final double lon;

  WeatherByLocationEvent({required this.lat, required this.lon});
}