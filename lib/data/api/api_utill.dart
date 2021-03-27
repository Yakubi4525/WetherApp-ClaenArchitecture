import 'package:news_clean_arch/data/api/model/weather_model_api.dart';
import 'package:news_clean_arch/data/api/service/weather_service.dart';

class ApiUtill {
  WeatherService _weatherService;
  ApiUtill(this._weatherService);

  Future<ApiWeather> getWeather(String cityName) async {
    var weather = await _weatherService.getCityWeather(cityName);
    return weather;
  }
}
