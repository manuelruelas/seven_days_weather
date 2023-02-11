import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:seven_days_weather/domain/entities/place.dart';
import 'package:seven_days_weather/domain/entities/place_weather.dart';
import 'package:seven_days_weather/domain/usecases/get_places.dart';
import 'package:seven_days_weather/domain/usecases/get_weather_by_place.dart';

part 'places_event.dart';
part 'places_state.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  GetPlaces getPlaces;
  GetWeatherByPlace getWeatherByPlace;
  PlacesBloc({required this.getPlaces, required this.getWeatherByPlace})
      : super(PlacesInitial()) {
    on<SearchPlaces>(_onSearchPlaces,
        transformer: debounceTransformer(Duration(milliseconds: 400)));
    on<AddPlace>(_onAddPlaces);
    on<ClearSearch>(_onClearSearch);
  }

  FutureOr<void> _onSearchPlaces(SearchPlaces event, emit) async {
    if (event.query.isEmpty) return;
    final places = await getPlaces.call(GetPlacesParams(query: event.query));
    places.fold((l) {}, (places) => emit(state.copyWith(placesFound: places)));
  }

  FutureOr<void> _onAddPlaces(AddPlace event, Emitter<PlacesState> emit) async {
    emit(state.copyWith(isLoading: true));
    final place = event.place;
    final response = await getWeatherByPlace(
        GetWeatherByPlaceParams(lat: place.latitude, lon: place.longitude));
    response.fold((l) => {emit(state.copyWith(isLoading: false))}, (weather) {
      final placeWeather =
          PlaceWeather(place: place, coordinatesWeather: weather);
      emit(state.copyWith(
        selectedPlaces: List.of(state.selectedPlaces)..add(placeWeather),
        isLoading: false,
      ));
    });
  }

  FutureOr<void> _onClearSearch(ClearSearch event, Emitter<PlacesState> emit) {
    emit(state.copyWith(placesFound: []));
  }

  EventTransformer<Event> debounceTransformer<Event>(Duration duration) {
    return (events, mapper) {
      return events.debounceTime(duration).switchMap(mapper);
    };
  }
}
