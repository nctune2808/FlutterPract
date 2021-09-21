import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_bloc/model/weather.dart';

abstract class WeatherRepository {
  /// Throws [NetworkException].
  Future<Weather> fetchWeather(String cityName);
  Future<Weather> fetchDetailWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository {
  double temperatureCelsius = 0;
  @override
  Future<Weather> fetchWeather(String cityName) {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
      () {
        final random = Random();

        // Simulate some network exception
        if (random.nextBool()) {
          throw NetworkImageLoadException;
        }

        temperatureCelsius = 20 + random.nextInt(15) + random.nextDouble();
        // Return "fetched" weather
        return Weather(
          cityName: cityName,
          // Temperature between 20 and 35.99
          temperatureCelsius: temperatureCelsius,
        );
      },
    );
  }

  @override
  Future<Weather> fetchDetailWeather(String cityName) {
    // TODO: implement fetchDetailWeather
    return Future.delayed(
      Duration(seconds: 1),
      () {
        return Weather(
            cityName: cityName,
            temperatureCelsius: temperatureCelsius,
            temperatureFahrenheit: temperatureCelsius * 1.8 + 32);
      },
    );
  }
}
