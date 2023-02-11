import 'package:get_it/get_it.dart';
import 'package:seven_days_weather/core/networking/api/reservamos_api.dart';
import 'package:seven_days_weather/data/datasources/remote/places_remote_datarouse.dart';
import 'package:seven_days_weather/data/repositories/places_repository_impl.dart';
import 'package:seven_days_weather/domain/repositories/places_repository.dart';
import 'package:seven_days_weather/domain/usecases/get_places.dart';
import 'package:seven_days_weather/presentation/places/bloc/places_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  sl.registerSingleton<ReservamosApi>(ReservamosApi());

  sl.registerFactory<PlacesRemoteDatasource>(
      () => PlacesRemoteDatasourceImpl(client: sl()));

  sl.registerFactory<PlacesRepository>(
      () => PlacesRepositoryImpl(placesRemoteDatasource: sl()));

  sl.registerFactory<GetPlaces>(() => GetPlaces(placesRepository: sl()));

  sl.registerSingleton<PlacesBloc>(PlacesBloc(getPlaces: sl()));
}
