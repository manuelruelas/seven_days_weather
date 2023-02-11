import 'package:seven_days_weather/domain/entities/coordinates_weather.dart';
import 'package:seven_days_weather/domain/entities/place.dart';

class PlaceWeather {
  Place place;
  CoordinatesWeather coordinatesWeather;
  PlaceWeather({required this.place, required this.coordinatesWeather});
}
