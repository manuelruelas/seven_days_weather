import 'package:dio/dio.dart';

class ReservamosApi {
  final dio = createDio();

  ReservamosApi._internal();

  static final _singleton = ReservamosApi._internal();

  factory ReservamosApi() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: "https://search.reservamos.mx/api/v2",
      receiveTimeout: 15000, // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
    ));

    return dio;
  }
}
