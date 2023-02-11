import 'package:seven_days_weather/data/datasources/remote/places_remote_datarouse.dart';
import 'package:seven_days_weather/domain/entities/place.dart';
import 'package:seven_days_weather/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:seven_days_weather/domain/repositories/places_repository.dart';

class PlacesRepositoryImpl implements PlacesRepository {
  PlacesRemoteDatasource placesRemoteDatasource;

  PlacesRepositoryImpl({required this.placesRemoteDatasource});
  @override
  Future<Either<Failure, List<Place>>> getPlaces(String query) async {
    try {
      final places = await placesRemoteDatasource.getPlaceList(query: query);
      return Right(places);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
