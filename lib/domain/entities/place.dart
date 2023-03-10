import 'package:equatable/equatable.dart';

class Place extends Equatable {
  Place({
    required this.id,
    required this.display,
    required this.cityName,
    required this.state,
    required this.country,
    this.lat,
    this.long,
    required this.resultType,
  });

  int id;
  String display;
  String cityName;
  String state;
  String country;
  String? lat;
  String? long;
  PlaceType resultType;

  double get latitude => double.tryParse(lat!) ?? 0.0;
  double get longitude => double.tryParse(long!) ?? 0.0;

  @override
  List<Object?> get props =>
      [id, display, cityName, state, country, lat, long, resultType];
}

enum PlaceType { city, terminal, airport }
