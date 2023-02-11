import 'package:flutter/material.dart';
import 'package:seven_days_weather/domain/entities/daily_weather.dart';
import 'package:seven_days_weather/domain/entities/place_weather.dart';

class WeatherRow extends StatelessWidget {
  final PlaceWeather placeWeather;
  final Function(DismissDirection direction)? onDismissed;
  const WeatherRow({super.key, required this.placeWeather, this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(placeWeather.place.id.toString()),
      onDismissed: (direction) {
        if (onDismissed == null) return;
        onDismissed!(direction);
      },
      child: Container(
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          placeWeather.place.display,
                          style: Theme.of(context).textTheme.headlineSmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          placeWeather.place.state,
                          style: Theme.of(context).textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          placeWeather.coordinatesWeather.current.weather.first
                              .description
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
                  ),
                  Spacer(),
                  Image.network(
                    placeWeather.coordinatesWeather.iconUrl,
                    width: 80,
                    height: 80,
                  )
                ],
              ),
              Divider(
                color: Colors.blue[100],
              ),
              Text(
                "Proximos 7 dias",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 110,
                width: double.infinity,
                child: ListView.separated(
                  physics: const PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: placeWeather.coordinatesWeather.daily.length,
                  separatorBuilder: (context, index) {
                    return Container(
                      width: 1,
                      color: Colors.blue[100],
                    );
                  },
                  itemBuilder: (context, index) {
                    return DailyWeatherView(
                        dailyWeather:
                            placeWeather.coordinatesWeather.daily[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DailyWeatherView extends StatelessWidget {
  const DailyWeatherView({
    super.key,
    required this.dailyWeather,
  });

  final DailyWeather dailyWeather;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Text(
            dailyWeather.date,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Image.network(
            dailyWeather.weather.first.iconUrl,
            height: 50.0,
          ),
          Text("Máx:${dailyWeather.temp.max.toStringAsFixed(0)}º"),
          Text("Mín:${dailyWeather.temp.min.toStringAsFixed(0)}º"),
        ],
      ),
    );
  }
}
