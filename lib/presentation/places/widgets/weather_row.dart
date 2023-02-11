import 'package:flutter/material.dart';

class WeatherRow extends StatelessWidget {
  const WeatherRow({
    super.key,
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
                      "Toronto",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "Nublado",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      "24º",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: Colors.black),
                    )
                  ],
                ),
                Spacer(),
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
