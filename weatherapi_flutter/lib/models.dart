class WeatherResponse {
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weaInfo;

  String get iconURL {
    return 'https://openweathermap.org/img/wn/${weaInfo.icon}@2x.png';
  }

  WeatherResponse(
      {required this.cityName, required this.tempInfo, required this.weaInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final tempInfo = TemperatureInfo.fromJson(json['main']);
    final weaInfo = WeatherInfo.fromJson(json['weather'][0]);

    return WeatherResponse(
        cityName: cityName, tempInfo: tempInfo, weaInfo: weaInfo);
  }
}

class TemperatureInfo {
  final double temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}
