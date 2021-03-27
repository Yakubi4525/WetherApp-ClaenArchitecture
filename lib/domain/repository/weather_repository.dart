import 'package:flutter/foundation.dart';
import 'package:news_clean_arch/domain/model/WeatherModel.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getWeather({@required String name});
}
