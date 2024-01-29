import 'package:weather_app/bloc/weather.event.dart';
import 'package:weather_app/enum/state.enum.dart';
import 'package:weather_app/model/weather.model.dart';

class WeatherState {
  StateStatus? requestState;
  String? errorMessage;
  List<Timeline>? weather;
  WeatherEvent? currentAction;

  WeatherState(
      {this.currentAction, this.errorMessage, this.requestState, this.weather});
}

class WeatherInitial extends WeatherState {
  WeatherInitial({
    required super.requestState,
  });
}
