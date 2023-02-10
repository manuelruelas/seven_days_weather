import 'package:seven_days_weather/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:seven_days_weather/core/usecases/usecase.dart';
import 'package:seven_days_weather/domain/entities/place_weather.dart';

class GetWeatherByPlace
    implements UseCase<PlaceWeather, GetWeatherByPlaceParams> {
  @override
  Future<Either<Failure, PlaceWeather>> call(GetWeatherByPlaceParams params) {
    throw UnimplementedError();
  }
}

class GetWeatherByPlaceParams {
  String lat;
  String lon;
  GetWeatherByPlaceParams({required this.lat, required this.lon});
}
