import 'package:seven_days_weather/domain/entities/place_weather.dart';
import 'package:seven_days_weather/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:seven_days_weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<Either<Failure, PlaceWeather>> getWeatherByPlace(
      {required String lat, required String lon}) {
    // TODO: implement getWeatherByPlace
    throw UnimplementedError();
  }
}
