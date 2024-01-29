import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/date.dart';
import 'package:weather_app/model/weather.model.dart';

class ListWeatherWidget extends StatelessWidget {
  ListWeatherWidget({super.key, required this.weather});
  Timeline weather;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: weather.intervals!.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            leading: Text(
                formatDate((weather.intervals![index].startTime.toString()))),
            title: Text(
                "Vitesse du vent : ${weather.intervals![index].values!["windSpeed"]}\nTempérature : ${weather.intervals![index].values!["temperature"]}\nTempérature apparent : ${weather.intervals![index].values!["temperatureApparent"]}"),
            isThreeLine: true,
          ),
        );
      },
    );
  }
}
