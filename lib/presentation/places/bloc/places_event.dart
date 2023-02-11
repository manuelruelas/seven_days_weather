part of 'places_bloc.dart';

abstract class PlacesEvent extends Equatable {
  const PlacesEvent();

  @override
  List<Object> get props => [];
}

class SearchPlaces extends PlacesEvent {
  final String query;
  const SearchPlaces({required this.query});
}

class AddPlace extends PlacesEvent {
  final Place place;
  const AddPlace({required this.place});
}
