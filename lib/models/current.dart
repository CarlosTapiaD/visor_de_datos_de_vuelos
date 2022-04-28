import 'dart:convert';

class Current {
  Current({
    required this.cloudcover,
    required this.feelslike,
    required this.humidity,
    required this.isDay,
    required this.observationTime,
    required this.precip,
    required this.pressure,
    required this.temperature,
    required this.uvIndex,
    required this.visibility,
    required this.weatherCode,
    required this.weatherDescriptions,
    required this.weatherIcons,
    required this.windDegree,
    required this.windDir,
    required this.windSpeed,
  });

  int cloudcover;
  int feelslike;
  int humidity;
  String isDay;
  String observationTime;
  double precip;
  int pressure;
  int temperature;
  int uvIndex;
  int visibility;
  int weatherCode;
  List<String> weatherDescriptions;
  List<String> weatherIcons;
  int windDegree;
  String windDir;
  int windSpeed;

  factory Current.fromJson(String str) => Current.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Current.fromMap(Map<String, dynamic> json) => Current(
        cloudcover: json["cloudcover"],
        feelslike: json["feelslike"],
        humidity: json["humidity"],
        isDay: json["is_day"],
        observationTime: json["observation_time"],
        precip: double.parse(json["precip"].toString()),
        pressure: json["pressure"],
        temperature: json["temperature"],
        uvIndex: json["uv_index"],
        visibility: json["visibility"],
        weatherCode: json["weather_code"],
        weatherDescriptions:
            List<String>.from(json["weather_descriptions"].map((x) => x)),
        weatherIcons: List<String>.from(json["weather_icons"].map((x) => x)),
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        windSpeed: json["wind_speed"],
      );

  Map<String, dynamic> toMap() => {
        "cloudcover": cloudcover,
        "feelslike": feelslike,
        "humidity": humidity,
        "is_day": isDay,
        "observation_time": observationTime,
        "precip": precip,
        "pressure": pressure,
        "temperature": temperature,
        "uv_index": uvIndex,
        "visibility": visibility,
        "weather_code": weatherCode,
        "weather_descriptions":
            List<dynamic>.from(weatherDescriptions.map((x) => x)),
        "weather_icons": List<dynamic>.from(weatherIcons.map((x) => x)),
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "wind_speed": windSpeed,
      };
}
