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

    try {
      if (event is GetWeather) {
        yield WeatherLoading();
        final weather = await _weatherRepository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather);
      } else if (event is GetDetailedWeather) {
        // Code duplication 😢 to keep the code simple for the tutorial...

        final weather =
            await _weatherRepository.fetchDetailWeather(event.cityName);
        yield WeatherLoaded(weather);
      }
    } catch (e) {
      yield WeatherError("Couldn't fetch");
    }
  }
}
