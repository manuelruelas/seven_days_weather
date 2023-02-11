import 'package:flutter/material.dart';
import 'package:seven_days_weather/domain/entities/place_weather.dart';

class WeatherRow extends StatelessWidget {
  final PlaceWeather placeWeather;
  const WeatherRow({
    super.key,
    required this.placeWeather,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[200]!, width: 3.0),
        color: Colors.blue[100],
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.blue[50]!,
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      placeWeather.place.display,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      placeWeather
                          .coordinatesWeather.current.weather.first.description
                          .toUpperCase(),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      "${placeWeather.coordinatesWeather.current.temp.toInt()}º",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: Colors.black),
                    )
                  ],
                ),
                const Spacer(),
                Image.asset(
                  "assets/images/sun.png",
                  width: 80,
                  height: 80,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
