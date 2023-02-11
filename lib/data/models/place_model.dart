import 'package:seven_days_weather/domain/entities/place.dart';

class PlaceModel extends Place {
  PlaceModel({
    required super.id,
    required super.display,
    required super.cityName,
    required super.state,
    required super.country,
    super.lat = "",
    super.long = "",
    required super.resultType,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      id: json["id"],
      display: json["display"],
      cityName: json["city_name"],
      state: json["state"],
      country: json["country"],
      lat: json["lat"],
      long: json["long"],
      resultType: PlaceType.values.byName(json["result_type"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "display": display,
        "city_name": cityName,
        "state": state,
        "country": country,
        "lat": lat,
        "long": long,
        "result_type": resultType,
      };
}
