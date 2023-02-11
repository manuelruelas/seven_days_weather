import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:seven_days_weather/core/networking/api/open_weather_api.dart';
import 'package:seven_days_weather/data/models/coordinates_weather_model.dart';

abstract class WeatherRemoteDatasource {
  Future<CoordinatesWeatherModel> getWeatherByPlace(double lat, double lon);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDatasource {
  final OpenWeatherApi client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<CoordinatesWeatherModel> getWeatherByPlace(
      double lat, double lon) async {
    final response = await client.dio.get('/onecall', queryParameters: {
      "lat": lat,
      "lon": lon,
      "exclude": ["minutely,hourly,alerts"],
      "lang": "es",
      "units": "metric",
      "appid": dotenv.get("OPEN_WEATHER_KEY"),
    });
    return CoordinatesWeatherModel.fromJson(response.data);
  }
}
