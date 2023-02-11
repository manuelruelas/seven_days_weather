import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:seven_days_weather/domain/entities/coordinates_weather.dart';
import 'package:seven_days_weather/domain/entities/current_weather.dart';
import 'package:seven_days_weather/domain/entities/daily_weather.dart';
import 'package:seven_days_weather/domain/entities/place.dart';
import 'package:seven_days_weather/domain/entities/place_weather.dart';
import 'package:seven_days_weather/domain/entities/temperature.dart';
import 'package:seven_days_weather/domain/entities/weather.dart';
import 'package:seven_days_weather/domain/usecases/get_places.dart';
import 'package:seven_days_weather/domain/usecases/get_weather_by_place.dart';
import 'package:seven_days_weather/presentation/places/bloc/places_bloc.dart';

import 'places_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetPlaces>(), MockSpec<GetWeatherByPlace>()])
main() {
  late PlacesBloc placesBloc;
  late MockGetPlaces mockGetPlaces;
  late MockGetWeatherByPlace mockGetWeatherByPlace;
  late Place mockPlace;
  late CoordinatesWeather mockCoordinateWeather;
  setUp(() {
    mockGetPlaces = MockGetPlaces();
    mockGetWeatherByPlace = MockGetWeatherByPlace();
    placesBloc = PlacesBloc(
        getPlaces: mockGetPlaces, getWeatherByPlace: mockGetWeatherByPlace);
    mockPlace = Place(
        lat: "23.3",
        long: "-12.3",
        id: 1,
        display: "Los Mochis",
        cityName: "Los Mochis",
        state: "Sinaloa",
        country: "México",
        resultType: PlaceType.city);
    mockCoordinateWeather = CoordinatesWeather(
      lat: 12.30,
      lon: -32.40,
      timezone: "",
      timezoneOffset: 123,
      daily: [
        DailyWeather(
            dt: 123,
            sunrise: 234,
            sunset: 234,
            moonrise: 234,
            moonset: 234,
            moonPhase: 0.8,
            temp: Temperature(
                day: 12, min: 23, max: 21, night: 32, eve: 42, morn: 11),
            pressure: 123,
            humidity: 12,
            dewPoint: 32.0,
            windSpeed: 23,
            windDeg: 23,
            weather: [
              Weather(
                  id: 1,
                  main: "Nublado",
                  description: "Nublado leve",
                  icon: "10d")
            ],
            clouds: 12,
            pop: 32,
            uvi: 23)
      ],
      current: Current(
        dt: 12345,
        sunrise: 12345,
        sunset: 12345,
        temp: 30.0,
        feelsLike: 28,
        pressure: 12332,
        humidity: 30,
        dewPoint: 20,
        clouds: 10,
        visibility: 90,
        windSpeed: 30,
        windDeg: 22,
        weather: [
          Weather(
              id: 1, main: "Nublado", description: "Nublado leve", icon: "ab1")
        ],
      ),
    );
    when(mockGetPlaces.call(any)).thenAnswer((_) async {
      return Right([mockPlace]);
    });
    when(mockGetWeatherByPlace.call(any)).thenAnswer(
      (_) async => Right(mockCoordinateWeather),
    );
  });

  blocTest(
    "Fetch places when user writes",
    setUp: () {},
    build: () => placesBloc,
    act: (bloc) => bloc..add(const SearchPlaces(query: "Mochis")),
    expect: () => [
      PlacesState(
        selectedPlaces: const [],
        placesFound: [mockPlace],
        isLoading: false,
      ),
    ],
  );

  blocTest(
    "Add place to selected places",
    build: () => placesBloc,
    act: (bloc) => bloc..add(AddPlace(place: mockPlace)),
    expect: () => [
      const PlacesState(selectedPlaces: [], placesFound: [], isLoading: true),
      PlacesState(
        selectedPlaces: [
          PlaceWeather(
              place: mockPlace, coordinatesWeather: mockCoordinateWeather)
        ],
        placesFound: const [],
        isLoading: false,
      )
    ],
  );

  blocTest(
    "Clear places in search",
    setUp: () {},
    build: () => placesBloc,
    act: (bloc) => bloc
      ..add(const SearchPlaces(query: "Mochis"))
      ..add(ClearSearch()),
    expect: () => [
      const PlacesState(
        selectedPlaces: [],
        placesFound: [],
        isLoading: false,
      ),
      PlacesState(
        selectedPlaces: const [],
        placesFound: [mockPlace],
        isLoading: false,
      ),
    ],
  );

  blocTest(
    "Remove place from selected places",
    build: () => placesBloc,
    act: (bloc) => bloc
      ..add(AddPlace(place: mockPlace))
      ..add(const RemoveItem(index: 0)),
    expect: () => [
      const PlacesState(selectedPlaces: [], placesFound: [], isLoading: true),
      PlacesState(
        selectedPlaces: [
          PlaceWeather(
              place: mockPlace, coordinatesWeather: mockCoordinateWeather)
        ],
        placesFound: const [],
        isLoading: false,
      ),
      const PlacesState(
        selectedPlaces: [],
        placesFound: [],
        isLoading: false,
      )
    ],
  );
}
