import 'package:flutter/foundation.dart';

class WeatherModel {
  int temp;
  int min_temp;
  int max_temp;
  WeatherModel(
      {@required this.temp, @required this.min_temp, @required this.max_temp});
}
