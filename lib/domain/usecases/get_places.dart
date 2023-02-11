import 'package:seven_days_weather/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:seven_days_weather/core/usecases/usecase.dart';
import 'package:seven_days_weather/domain/entities/place.dart';
import 'package:seven_days_weather/domain/repositories/places_repository.dart';

class GetPlaces implements UseCase<List<Place>, GetPlacesParams> {
  PlacesRepository placesRepository;

  GetPlaces({required this.placesRepository});

  @override
  Future<Either<Failure, List<Place>>> call(GetPlacesParams params) async {
    return await placesRepository.getPlaces(params.query);
  }
}

class GetPlacesParams {
  String query;
  GetPlacesParams({required this.query});
}
