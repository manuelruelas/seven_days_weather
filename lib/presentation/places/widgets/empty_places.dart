import 'package:flutter/material.dart';

class EmptyPlaces extends StatelessWidget {
  const EmptyPlaces({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/emptybox.png",
            width: 150,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "No hay ciudades seleccionadas.",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            "Agregue una desde el boton +",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
