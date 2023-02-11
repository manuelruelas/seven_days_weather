import 'package:dio/dio.dart';
import 'package:seven_days_weather/data/models/place_weather_model.dart';

abstract class WeatherRemoteDatasource {
  Future<CoordinatesWeatherModel> getWeatherByPlace(double lat, double lon);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDatasource {
  final Dio client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<CoordinatesWeatherModel> getWeatherByPlace(
      double lat, double lon) async {
    final response = await client.get('/onecall', queryParameters: {
      "lat": lat,
      "lon": lon,
      "exclude": ["minutely,hourly,alerts"],
      "appid": "",
    });
    return CoordinatesWeatherModel.fromJson(response.data);
  }
}
