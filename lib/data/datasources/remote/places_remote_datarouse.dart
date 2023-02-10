import 'package:dio/dio.dart';
import 'package:seven_days_weather/data/models/place_model.dart';

abstract class PlacesRemoteDatasource {
  Future<List<PlaceModel>> getPlaceList({required String query});
}

class PlacesRemoteDatasourceImpl implements PlacesRemoteDatasource {
  final Dio client;

  PlacesRemoteDatasourceImpl({required this.client});

  @override
  Future<List<PlaceModel>> getPlaceList({required String query}) async {
    final response =
        await client.get('/onecall', queryParameters: {"q": query});
    return (response.data as List)
        .map((place) => PlaceModel.fromJson(place))
        .toList();
  }
}
