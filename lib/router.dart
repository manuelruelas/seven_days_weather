import 'package:go_router/go_router.dart';
import 'package:seven_days_weather/presentation/places/places.dart';
import 'package:seven_days_weather/presentation/places/screens/places_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const Places(),
  ),
]);
