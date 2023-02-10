import 'package:dio/dio.dart';

class OpenWeatherApi {
  final dio = createDio();

  OpenWeatherApi._internal();

  static final _singleton = OpenWeatherApi._internal();

  factory OpenWeatherApi() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: "https://api.openweathermap.org/data/3.0",
      receiveTimeout: 15000, // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
    ));

    return dio;
  }
}
