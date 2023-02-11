class Place {
  Place({
    required this.id,
    required this.slug,
    required this.citySlug,
    required this.display,
    required this.asciiDisplay,
    required this.cityName,
    required this.cityAsciiName,
    required this.state,
    required this.country,
    required this.lat,
    required this.long,
    required this.resultType,
    required this.popularity,
    required this.sortCriteria,
  });

  int id;
  String slug;
  String citySlug;
  String display;
  String asciiDisplay;
  String cityName;
  String cityAsciiName;
  String state;
  String country;
  String lat;
  String long;
  PlaceType resultType;
  String popularity;
  double sortCriteria;
}

enum PlaceType { city, terminal, airport }
