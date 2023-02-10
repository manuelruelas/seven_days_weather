import 'package:seven_days_weather/domain/entities/current_weather.dart';
import 'package:seven_days_weather/domain/entities/daily_weather.dart';

class PlaceWeather {
  PlaceWeather({
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
}
