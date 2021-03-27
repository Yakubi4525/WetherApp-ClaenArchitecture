import 'package:news_clean_arch/data/api/api_utill.dart';
import 'package:news_clean_arch/data/api/service/weather_service.dart';

class ApiModule {
  static ApiUtill _apiUtil;

  static ApiUtill getApiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtill(WeatherService());
    }
    return _apiUtil;
  }
}
