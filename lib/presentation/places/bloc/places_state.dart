part of 'places_bloc.dart';

class PlacesState extends Equatable {
  List<Place> placesFound;
  List<Place> selectedPlaces;
  PlacesState({this.selectedPlaces = const [], this.placesFound = const []});

  PlacesState copyWith(
      {List<Place>? selectedPlaces, List<Place>? placesFound}) {
    return PlacesState(
      selectedPlaces: selectedPlaces ?? this.selectedPlaces,
      placesFound: placesFound ?? this.placesFound,
    );
  }

  @override
  List<Object> get props => [selectedPlaces];
}

class PlacesInitial extends PlacesState {}

class PlacesError extends PlacesState {}
