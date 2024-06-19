import 'package:bloc/bloc.dart';
import 'package:climate_app/data/weather_model.dart';
import 'package:meta/meta.dart';

import '../data/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherLoadingState()) {
    // on<WeatherEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<WeatherByLocationEvent>((event, emit) async{
      // TODO: implement event handler
      emit(WeatherLoadingState());
      try {
        final weatherModel = await weatherRepository.getWeatherByLocation(event.lat, event.lon);

        emit(WeatherLoadSuccessState(weatherModel));
      } catch (e) {
        print(e);
        emit(WeatherLoadErrorState(e.toString()));
      }
    });

    on<WeatherByCityEvent>((event, emit) async{
      // TODO: implement event handler
      emit(WeatherLoadingState());
      try {
        final weatherModel = await weatherRepository.getWeatherByCity(event.cityName);

        emit(WeatherLoadSuccessState(weatherModel));
      } catch (e) {
        print(e);
        emit(WeatherLoadErrorState(e.toString()));
      }
    });
  }
}
