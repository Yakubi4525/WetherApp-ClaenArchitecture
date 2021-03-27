import 'package:news_clean_arch/data/api/api_utill.dart';
import 'package:news_clean_arch/data/mapper/to_weather.dart';
import 'package:news_clean_arch/domain/model/WeatherModel.dart';
import 'package:news_clean_arch/domain/repository/weather_repository.dart';

class WeatherRepositoryData extends WeatherRepository {
  final ApiUtill apiUtill;
  WeatherRepositoryData(this.apiUtill);

  @override
  Future<WeatherModel> getWeather({String name}) async {
    // TODO: implement getWeather
    var weatherApi = await apiUtill.getWeather(name);
    if (weatherApi != 0) return WeatherMapper.fromApi(weatherApi);
    return null;

  }
}
