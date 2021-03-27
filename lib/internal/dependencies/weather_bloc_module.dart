import 'package:news_clean_arch/data/weather_repository_data.dart';
import 'package:news_clean_arch/domain/bloc/get_weather_bloc.dart';
import 'package:news_clean_arch/internal/dependencies/api_module.dart';

class WeatherBlocModule {
  static GetWeatherBloc _weatherBloc;

  static GetWeatherBloc getBloc() {
    if (_weatherBloc == null) {
      _weatherBloc =
          GetWeatherBloc(WeatherRepositoryData(ApiModule.getApiUtil()));
    }
    return _weatherBloc;
  }
}
