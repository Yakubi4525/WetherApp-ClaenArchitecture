class ApiWeather {
  int temp;
  int min_temp;
  int max_temp;
  bool hasError;
  ApiWeather.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      hasError = true;
      return;
    } else {
      hasError = false;
    }
    temp = map["main"]["temp"];
    min_temp = map["main"]["temp_min"];
    max_temp = map["main"]["max_temp"];
  }
}
