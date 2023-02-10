import 'package:seven_days_weather/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:seven_days_weather/core/usecases/usecase.dart';
import 'package:seven_days_weather/domain/entities/place.dart';

class GetPlaces implements UseCase<List<Place>, GetPlacesParams> {
  @override
  Future<Either<Failure, List<Place>>> call(GetPlacesParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class GetPlacesParams {
  String query;
  GetPlacesParams({required this.query});
}
