import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seven_days_weather/domain/entities/place.dart';
import 'package:seven_days_weather/domain/usecases/get_places.dart';

part 'places_event.dart';
part 'places_state.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  GetPlaces getPlaces;
  PlacesBloc({required this.getPlaces}) : super(PlacesInitial()) {
    on<SearchPlaces>(_onSearchPlaces);
    on<AddPlace>(_onAddPlaces);
  }

  FutureOr<void> _onSearchPlaces(SearchPlaces event, emit) async {
    final places = await getPlaces.call(GetPlacesParams(query: event.query));
    places.fold((l) => emit(PlacesError()),
        (places) => emit(state.copyWith(placesFound: places)));
  }

  FutureOr<void> _onAddPlaces(AddPlace event, Emitter<PlacesState> emit) {
    emit(state.copyWith(
        selectedPlaces: List.of(state.selectedPlaces)..add(event.place)));
  }
}
