import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/date.dart';
import 'package:weather_app/model/weather.model.dart';

class ListWeatherWidget extends StatelessWidget {
  ListWeatherWidget({super.key, required this.weather});
  Timeline weather;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: weather.intervals!.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            tileColor: Colors.blue[200],
            leading: Text(
                formatDate((weather.intervals![index].startTime.toString()))),
            title: Text(
                "Vitesse du vent : ${weather.intervals![index].values!["windSpeed"]}"),
            subtitle: Text(
                "Température : ${weather.intervals![index].values!["temperature"]}\nTempérature apparent : ${weather.intervals![index].values!["temperatureApparent"]}"),
            isThreeLine: true,
          ),
        );
      },
    );
  }
}
