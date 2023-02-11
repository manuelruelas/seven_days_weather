import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seven_days_weather/core/service_locator.dart';

import 'package:seven_days_weather/presentation/places/places.dart';

import 'places_screen_test.mocks.dart';

void main() {
  setUp(() async {
    await dotenv.load();
    await setupLocator();
  });
  testWidgets("Show empty screen when app is open", (tester) async {
    await tester.pumpWidget(MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
            home: BlocProvider(
          create: (context) => MockPlacesBloc(),
          child: const Places(),
        ))));
    final emptyTitle = find.text("No hay ciudades seleccionadas.");
    final emptyInstruction = find.text("Agregue una desde el boton +");
    expect(emptyTitle, findsOneWidget);
    expect(emptyInstruction, findsOneWidget);
  }, skip: true);

  testWidgets("Show search bottom sheet when FAB is tapped", (tester) async {
    await tester.pumpWidget(const MediaQuery(
        data: MediaQueryData(), child: MaterialApp(home: Places())));
    final fab = find.byType(FloatingActionButton);
    expect(fab, findsOneWidget);
    await tester.tap(fab);
    await tester.pump();
    final bottomSheetTitle = find.text("Ingrese su proximo destino");
    expect(bottomSheetTitle, findsOneWidget);
  }, skip: true);
}
