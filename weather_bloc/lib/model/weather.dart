import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String cityName;
  final double temperatureCelsius;
  final double temperatureFahrenheit;

  Weather({
    required this.cityName,
    required this.temperatureCelsius,
    this.temperatureFahrenheit = 0,
  });

  @override
  // TODO: implement props
  List<Object> get props =>
      [cityName, temperatureCelsius, temperatureFahrenheit];
}
