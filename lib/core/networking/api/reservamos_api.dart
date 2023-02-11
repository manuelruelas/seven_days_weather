import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ReservamosApi {
  final dio = createDio();

  ReservamosApi._internal();

  static final _singleton = ReservamosApi._internal();

  factory ReservamosApi() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: dotenv.get("RESERVAMOS_API_URL"),
      receiveTimeout: 15000, // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
    ));

    return dio;
  }
}
