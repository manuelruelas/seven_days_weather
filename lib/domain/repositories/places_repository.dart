import 'package:dartz/dartz.dart';
import 'package:seven_days_weather/core/error/failures.dart';
import 'package:seven_days_weather/domain/entities/place.dart';

abstract class PlacesRepository {
  Future<Either<Failure, List<Place>>> getPlaces(String query);
}
