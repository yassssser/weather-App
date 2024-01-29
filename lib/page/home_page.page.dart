import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather.bloc.dart';
import 'package:weather_app/bloc/weather.event.dart';
import 'package:weather_app/bloc/weather.state.dart';
import 'package:weather_app/enum/state.enum.dart';
import 'package:weather_app/page/widget/list_weather.widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(FetchWeather());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state.requestState == StateStatus.LOADING) {
            return Center(child: CircularProgressIndicator());
          } else if (state.requestState == StateStatus.LOADED) {
            return ListView.builder(
              itemCount: state.weather!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListWeatherWidget(weather: state.weather![index]);
              },
            );
          } else if (state.requestState == StateStatus.ERROR) {
            return Center(child: Text(state.errorMessage!));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
