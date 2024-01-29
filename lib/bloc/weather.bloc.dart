import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/bloc/weather.event.dart';
import 'package:weather_app/bloc/weather.state.dart';
import 'package:weather_app/enum/state.enum.dart';
import 'package:weather_app/model/weather.model.dart';
import 'package:weather_app/service/weather.service.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherService? get _weatherService => GetIt.I<WeatherService>();

  WeatherBloc() : super(WeatherInitial(requestState: StateStatus.NONE)) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherState(
        requestState: StateStatus.LOADING,
      ));
      try {
        Weather res = await _weatherService!.getWeather();

        emit(WeatherState(
          requestState: StateStatus.LOADED,
          weather: res.data!.timelines,
        ));
      } on DioException catch (e) {
        debugPrint(e.toString());

        emit(WeatherState(
          errorMessage:
              "Une erreur technique est survenue veuillez réessayer ultérieurement",
          requestState: StateStatus.ERROR,
          currentAction: event,
        ));
      } catch (e) {
        debugPrint(e.toString());
        emit(WeatherState(
          requestState: StateStatus.ERROR,
          errorMessage:
              "Une erreur technique est survenue veuillez réessayer plus tard",
          currentAction: event,
        ));
      }
    });
  }
}
