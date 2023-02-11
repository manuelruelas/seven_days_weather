import 'package:seven_days_weather/domain/entities/place.dart';

class PlaceModel extends Place {
  PlaceModel(
      {required super.id,
      required super.slug,
      required super.citySlug,
      required super.display,
      required super.asciiDisplay,
      required super.cityName,
      required super.cityAsciiName,
      required super.state,
      required super.country,
      required super.lat,
      required super.long,
      required super.resultType,
      required super.popularity,
      required super.sortCriteria});

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        id: json["id"],
        slug: json["slug"],
        citySlug: json["city_slug"],
        display: json["display"],
        asciiDisplay: json["ascii_display"],
        cityName: json["city_name"],
        cityAsciiName: json["city_ascii_name"],
        state: json["state"],
        country: json["country"],
        lat: json["lat"],
        long: json["long"],
        resultType: PlaceType.values.byName(json["result_type"]),
        popularity: json["popularity"],
        sortCriteria: json["sort_criteria"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "city_slug": citySlug,
        "display": display,
        "ascii_display": asciiDisplay,
        "city_name": cityName,
        "city_ascii_name": cityAsciiName,
        "state": state,
        "country": country,
        "lat": lat,
        "long": long,
        "result_type": resultType,
        "popularity": popularity,
        "sort_criteria": sortCriteria,
      };
}
