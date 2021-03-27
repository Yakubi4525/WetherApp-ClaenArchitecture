import 'package:news_clean_arch/data/api/model/weather_model_api.dart';
import 'package:news_clean_arch/domain/model/WeatherModel.dart';

class WeatherMapper {
  static fromApi(ApiWeather apiWeather) {
    if (apiWeather.hasError) return null;
    return WeatherModel(
        temp: apiWeather.temp,
        min_temp: apiWeather.min_temp,
        max_temp: apiWeather.min_temp);
  }
}
