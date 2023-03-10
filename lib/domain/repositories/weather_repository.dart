import 'package:dartz/dartz.dart';
import 'package:seven_days_weather/core/error/failures.dart';
import 'package:seven_days_weather/domain/entities/coordinates_weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, CoordinatesWeather>> getWeatherByPlace(
      {required double lat, required double lon});
}
