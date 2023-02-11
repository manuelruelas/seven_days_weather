part of 'places_bloc.dart';

class PlacesState extends Equatable {
  final bool isLoading;
  final List<Place> placesFound;
  final List<PlaceWeather> selectedPlaces;

  const PlacesState({
    this.selectedPlaces = const [],
    this.placesFound = const [],
    this.isLoading = false,
  });

  PlacesState copyWith(
      {List<PlaceWeather>? selectedPlaces,
      List<Place>? placesFound,
      bool? isLoading}) {
    return PlacesState(
      selectedPlaces: selectedPlaces ?? this.selectedPlaces,
      placesFound: placesFound ?? this.placesFound,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        selectedPlaces,
        placesFound,
        isLoading,
      ];
}

class PlacesInitial extends PlacesState {}

class PlacesNotEmpty extends PlacesState {}

class PlacesError extends PlacesState {}
