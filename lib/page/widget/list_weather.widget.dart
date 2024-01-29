import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.model.dart';

class ListWeatherWidget extends StatelessWidget {
  ListWeatherWidget({super.key, required this.weather});
  Timeline weather;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: weather.intervals!.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title:
              Text(weather.intervals![index].values!["windSpeed"].toString()),
        );
      },
    );
  }
}
