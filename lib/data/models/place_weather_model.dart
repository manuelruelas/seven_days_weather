import 'package:seven_days_weather/domain/entities/current_weather.dart';
import 'package:seven_days_weather/domain/entities/daily_weather.dart';
import 'package:seven_days_weather/domain/entities/place_weather.dart';

class PlaceWeatherModel extends PlaceWeather {
  PlaceWeatherModel({
    required double lat,
    required double lon,
    required String timezone,
    required int timezoneOffset,
    required Current current,
    required List<DailyWeather> daily,
  }) : super(
            lat: lat,
            lon: lon,
            timezone: timezone,
            timezoneOffset: timezoneOffset,
            current: current,
            daily: daily);

  factory PlaceWeatherModel.fromJson(Map<String, dynamic> json) =>
      PlaceWeatherModel(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
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
