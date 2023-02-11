import 'package:seven_days_weather/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:seven_days_weather/core/usecases/usecase.dart';
import 'package:seven_days_weather/domain/entities/place_weather.dart';
import 'package:seven_days_weather/domain/repositories/weather_repository.dart';

class GetWeatherByPlace
    implements UseCase<CoordinatesWeather, GetWeatherByPlaceParams> {
  WeatherRepository weatherRepository;

  GetWeatherByPlace({required this.weatherRepository});

  @override
  Future<Either<Failure, CoordinatesWeather>> call(
      GetWeatherByPlaceParams params) async {
    return await weatherRepository.getWeatherByPlace(
        lat: params.lat, lon: params.lon);
  }
}

class GetWeatherByPlaceParams {
  double lat;
  double lon;
  GetWeatherByPlaceParams({required this.lat, required this.lon});
}
