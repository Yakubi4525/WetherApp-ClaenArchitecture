import 'package:news_clean_arch/domain/model/WeatherModel.dart';

class WeatherModelInitState extends WeatherModel {}

class WeatherModelLoading extends WeatherModel {}

class WeatherModelError extends WeatherModel {
  String error;
  WeatherModelError(this.error);
}

class WeatherModelOk extends WeatherModel {
  WeatherModelOk(WeatherModel model)
    :super(temp: model.temp, min_temp:model.min_temp, max_temp:model.max_temp);
  
}
