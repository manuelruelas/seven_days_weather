import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:seven_days_weather/core/service_locator.dart';
import 'package:seven_days_weather/presentation/places/bloc/places_bloc.dart';
import 'package:seven_days_weather/presentation/places/widgets/empty_places.dart';
import 'package:seven_days_weather/presentation/places/widgets/place_row.dart';
import 'package:seven_days_weather/presentation/places/widgets/weather_row.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showAddPlaceBottomSheet(context);
          }),
      appBar: AppBar(
        title: const Text(
          "Clima",
        ),
      ),
      body: BlocBuilder<PlacesBloc, PlacesState>(
        builder: (context, state) {
          return Stack(
            children: [
              state.selectedPlaces.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: ListView.builder(
                        itemCount: state.selectedPlaces.length,
                        itemBuilder: ((context, index) {
                          return WeatherRow(
                            placeWeather: state.selectedPlaces[index],
                            onDismissed: (direction) {
                              sl<PlacesBloc>().add(RemoveItem(index: index));
                            },
                          );
                        }),
                      ),
                    )
                  : const EmptyPlaces(),
              Visibility(
                visible: state.isLoading,
                child: const Opacity(
                  opacity: 0.8,
                  child: ModalBarrier(dismissible: false, color: Colors.white),
                ),
              ),
              Visibility(
                visible: state.isLoading,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<dynamic> showAddPlaceBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return BlocProvider.value(
            value: sl<PlacesBloc>(),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ingrese su proximo destino",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  CupertinoSearchTextField(
                    onChanged: (value) =>
                        sl<PlacesBloc>().add(SearchPlaces(query: value)),
                  ),
                  BlocBuilder<PlacesBloc, PlacesState>(
                    builder: (context, state) {
                      return state.placesFound.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                  itemCount: state.placesFound.length,
                                  itemBuilder: (context, index) {
                                    return PlaceRow(
                                      place: state.placesFound[index],
                                      onPressed: () {
                                        context.pop();
                                        context.read<PlacesBloc>()
                                          ..add(AddPlace(
                                            place: state.placesFound[index],
                                          ))
                                          ..add(ClearSearch());
                                      },
                                    );
                                  }),
                            )
                          : Expanded(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      "assets/images/search.png",
                                      width: 100,
                                    ),
                                    const SizedBox(
                                      height: 16.0,
                                    ),
                                    Text(
                                      "Busca tu proximo destino",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ],
                                ),
                              ),
                            );
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
