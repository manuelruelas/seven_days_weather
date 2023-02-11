import 'package:flutter/material.dart';
import 'package:seven_days_weather/domain/entities/place.dart';

class PlaceRow extends StatelessWidget {
  final Place place;
  final VoidCallback? onPressed;
  const PlaceRow({
    super.key,
    required this.place,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(_getIcon()),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(place.display),
          Text(
            "${place.cityName}, ${place.state}",
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
      onTap: onPressed,
    );
  }

  IconData _getIcon() {
    switch (place.resultType) {
      case PlaceType.city:
        return Icons.location_city;
      case PlaceType.terminal:
        return Icons.bus_alert_sharp;
      case PlaceType.airport:
        return Icons.airplanemode_active;
    }
  }
}
