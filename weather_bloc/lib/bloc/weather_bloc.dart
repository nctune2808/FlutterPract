import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:weather_bloc/data/weather_repository.dart';
import 'package:weather_bloc/model/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    // TODO: implement mapEventToState

    if (event is GetWeather) {
      try {
        yield WeatherLoading();
        final weather = await _weatherRepository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkImageLoadException {
        yield WeatherError("Couldn't fetch");
      }
    }
  }
}
