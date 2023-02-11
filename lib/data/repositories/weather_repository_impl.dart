import 'package:seven_days_weather/data/datasources/remote/weather_remote_datasource.dart';
import 'package:seven_days_weather/domain/entities/place_weather.dart';
import 'package:seven_days_weather/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:seven_days_weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRemoteDatasource weatherRemoteDatasource;

  WeatherRepositoryImpl({required this.weatherRemoteDatasource});

  @override
  Future<Either<Failure, CoordinatesWeather>> getWeatherByPlace(
      {required double lat, required double lon}) async {
    try {
      final placeWeather =
          await weatherRemoteDatasource.getWeatherByPlace(lat, lon);
      return Right(placeWeather);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
