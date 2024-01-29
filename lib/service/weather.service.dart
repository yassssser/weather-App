import 'package:weather_app/model/weather.model.dart';
import 'package:weather_app/service/dio.init.dart';

class WeatherService {
  Future<Weather> getWeather() async {
    try {
      var res = await dio.get("/weather");
      return Weather.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
