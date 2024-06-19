part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherLoadingState extends WeatherState{}

final class WeatherLoadSuccessState extends WeatherState{
  final WeatherModel weatherModel;

  WeatherLoadSuccessState(this.weatherModel);
}


final class WeatherLoadErrorState extends WeatherState{
  final String errorMessage;

  WeatherLoadErrorState(this.errorMessage);
}