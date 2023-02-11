// Mocks generated by Mockito 5.3.2 from annotations
// in seven_days_weather/test/presentation/places/bloc/places_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:seven_days_weather/core/error/failures.dart' as _i7;
import 'package:seven_days_weather/domain/entities/coordinates_weather.dart'
    as _i10;
import 'package:seven_days_weather/domain/entities/place.dart' as _i8;
import 'package:seven_days_weather/domain/repositories/places_repository.dart'
    as _i2;
import 'package:seven_days_weather/domain/repositories/weather_repository.dart'
    as _i4;
import 'package:seven_days_weather/domain/usecases/get_places.dart' as _i5;
import 'package:seven_days_weather/domain/usecases/get_weather_by_place.dart'
    as _i9;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePlacesRepository_0 extends _i1.SmartFake
    implements _i2.PlacesRepository {
  _FakePlacesRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWeatherRepository_2 extends _i1.SmartFake
    implements _i4.WeatherRepository {
  _FakeWeatherRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetPlaces].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPlaces extends _i1.Mock implements _i5.GetPlaces {
  @override
  _i2.PlacesRepository get placesRepository => (super.noSuchMethod(
        Invocation.getter(#placesRepository),
        returnValue: _FakePlacesRepository_0(
          this,
          Invocation.getter(#placesRepository),
        ),
        returnValueForMissingStub: _FakePlacesRepository_0(
          this,
          Invocation.getter(#placesRepository),
        ),
      ) as _i2.PlacesRepository);
  @override
  set placesRepository(_i2.PlacesRepository? _placesRepository) =>
      super.noSuchMethod(
        Invocation.setter(
          #placesRepository,
          _placesRepository,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i8.Place>>> call(
          _i5.GetPlacesParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.Failure, List<_i8.Place>>>.value(
            _FakeEither_1<_i7.Failure, List<_i8.Place>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i3.Either<_i7.Failure, List<_i8.Place>>>.value(
                _FakeEither_1<_i7.Failure, List<_i8.Place>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, List<_i8.Place>>>);
}

/// A class which mocks [GetWeatherByPlace].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWeatherByPlace extends _i1.Mock implements _i9.GetWeatherByPlace {
  @override
  _i4.WeatherRepository get weatherRepository => (super.noSuchMethod(
        Invocation.getter(#weatherRepository),
        returnValue: _FakeWeatherRepository_2(
          this,
          Invocation.getter(#weatherRepository),
        ),
        returnValueForMissingStub: _FakeWeatherRepository_2(
          this,
          Invocation.getter(#weatherRepository),
        ),
      ) as _i4.WeatherRepository);
  @override
  set weatherRepository(_i4.WeatherRepository? _weatherRepository) =>
      super.noSuchMethod(
        Invocation.setter(
          #weatherRepository,
          _weatherRepository,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<_i3.Either<_i7.Failure, _i10.CoordinatesWeather>> call(
          _i9.GetWeatherByPlaceParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i6.Future<_i3.Either<_i7.Failure, _i10.CoordinatesWeather>>.value(
                _FakeEither_1<_i7.Failure, _i10.CoordinatesWeather>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i3.Either<_i7.Failure, _i10.CoordinatesWeather>>.value(
                _FakeEither_1<_i7.Failure, _i10.CoordinatesWeather>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.Failure, _i10.CoordinatesWeather>>);
}