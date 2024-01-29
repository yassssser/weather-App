import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/mock/weather.json.dart';
import 'package:weather_app/service/weather.service.dart';

class MockDio extends Mock implements Dio {}

WeatherService? get _weatherService => GetIt.I<WeatherService>();
void main() {
  group('getWeather', () {
    test('returns Weather object on successful request', () async {
      final expectedWeather = WeatherMock;

      final result = await _weatherService!.getWeather();

      expect(result.data, expectedWeather);
    });
  });
}
