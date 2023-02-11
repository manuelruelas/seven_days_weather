import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:seven_days_weather/domain/entities/current_weather.dart';
import 'package:seven_days_weather/domain/entities/daily_weather.dart';

class CoordinatesWeather {
  CoordinatesWeather({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.daily,
  });

  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  Current current;
  List<DailyWeather> daily;

  String get iconUrl =>
      "http://openweathermap.org/img/wn/${current.weather.first.icon}@4x.png";
}
