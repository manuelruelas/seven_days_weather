import 'package:dartz/dartz.dart';
import 'package:seven_days_weather/core/error/failures.dart';
import 'package:seven_days_weather/domain/entities/place_weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, PlaceWeather>> getWeatherByPlace(
      {required double lat, required double lon});
}
