import 'package:dio/dio.dart';
import 'package:seven_days_weather/data/models/place_weather_model.dart';
import 'package:seven_days_weather/domain/entities/place_weather.dart';

abstract class WeatherRemoteDatasource {
  Future<PlaceWeatherModel> getWeatherByPlace(double lat, double lon);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDatasource {
  final Dio client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<PlaceWeatherModel> getWeatherByPlace(double lat, double lon) async {
    final response = await client.get('/onecall', queryParameters: {
      "lat": lat,
      "lon": lon,
      "exclude": ["minutely,hourly,alerts"],
      "appid": "",
    });
    return PlaceWeatherModel.fromJson(response.data);
  }
}
