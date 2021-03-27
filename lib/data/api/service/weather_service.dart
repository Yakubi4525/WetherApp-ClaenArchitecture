import 'package:dio/dio.dart';
import 'package:news_clean_arch/data/api/model/weather_model_api.dart';

class WeatherService {
  static const apiKey = '67e09c25f0b382b277407d891040b68c';
  static const openWeatherMapURL =
      'https://api.openweathermap.org/data/2.5/weather';
  final Dio _dio = Dio(BaseOptions(baseUrl: openWeatherMapURL));

  Future<ApiWeather> getCityWeather(String cityName) async {
    try {
      final response = await _dio
          .get('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
      if (response.statusCode == 200) {
        return ApiWeather.fromJson(response.data);
      } else {
        return ApiWeather.fromJson(null);
      }
    } catch (error) {
      print(" Ошибка запроса");
      return ApiWeather.fromJson(null);
    }
  }
}
