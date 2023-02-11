import 'package:seven_days_weather/domain/entities/current_weather.dart';
import 'package:seven_days_weather/domain/entities/daily_weather.dart';
import 'package:seven_days_weather/domain/entities/coordinates_weather.dart';

class CoordinatesWeatherModel extends CoordinatesWeather {
  CoordinatesWeatherModel({
    required super.lat,
    required super.lon,
    required super.timezone,
    required super.timezoneOffset,
    required super.current,
    required super.daily,
  });

  factory CoordinatesWeatherModel.fromJson(Map<String, dynamic> json) =>
      CoordinatesWeatherModel(
        lat: json["lat"],
        lon: json["lon"],
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        current: Current.fromJson(json["current"]),
        daily: List<DailyWeather>.from(
            json["daily"].map((x) => DailyWeather.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "current": current.toJson(),
        "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
      };
}
