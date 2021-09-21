part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class GetWeather extends WeatherEvent {
  final String cityName;
  GetWeather(this.cityName);

  List<Object> get props => [cityName];
}

class GetDetailedWeather extends WeatherEvent {
  final String cityName;

  GetDetailedWeather(this.cityName);

  List<Object> get props => [cityName];
}
