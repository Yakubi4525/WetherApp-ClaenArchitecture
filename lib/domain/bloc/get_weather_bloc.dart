import 'dart:async';

import 'package:news_clean_arch/domain/bloc_models/bloc_weather_models.dart';
import 'package:news_clean_arch/domain/model/WeatherModel.dart';
import 'package:news_clean_arch/domain/repository/weather_repository.dart';

class GetWeatherBloc {
  StreamController<WeatherModel> _controller =
      StreamController<WeatherModel>.broadcast();

  WeatherRepository weatherRepository;
  GetWeatherBloc(this.weatherRepository);
  Stream<WeatherModel> get stream => _controller.stream;

  WeatherModel get defaultitem => WeatherModelInitState();

  void pickItem(WeatherModel model) {
    _controller.sink.add(model);
  }

  void LoadWeather(String cityName) async {
    _controller.sink.add(WeatherModelLoading());
    var weather = await weatherRepository.getWeather(name: cityName);
    if (weather != null) {
      _controller.sink.add(WeatherModelOk(weather));
    } else {
      _controller.sink.add(WeatherModelError("error"));
    }
  }

  close() {
    _controller.close();
  }
}

