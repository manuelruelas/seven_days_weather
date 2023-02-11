import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_days_weather/core/service_locator.dart';
import 'package:seven_days_weather/presentation/places/bloc/places_bloc.dart';
import 'package:seven_days_weather/presentation/places/screens/places_screen.dart';

class Places extends StatelessWidget {
  const Places({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlacesBloc>(
      create: (context) => sl<PlacesBloc>(),
      child: const PlacesScreen(),
    );
  }
}
