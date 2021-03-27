import 'package:flutter/material.dart';
import 'package:news_clean_arch/domain/bloc/get_weather_bloc.dart';
import 'package:news_clean_arch/domain/bloc_models/bloc_weather_models.dart';
import 'package:news_clean_arch/domain/model/WeatherModel.dart';
import 'package:news_clean_arch/internal/dependencies/weather_bloc_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WeatherpPickerScreen extends StatefulWidget {
  @override
  _WeatherpPickerScreenState createState() => _WeatherpPickerScreenState();
}

class _WeatherpPickerScreenState extends State<WeatherpPickerScreen> {
  TextEditingController _controller = TextEditingController();
  GetWeatherBloc _getWeatherBloc;

  @override
  void initState() {
    super.initState();
    _getWeatherBloc = WeatherBlocModule.getBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 200,
                      child: TextField(
                        decoration: InputDecoration(fillColor: Colors.grey),
                        controller: _controller,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: GestureDetector(
                        onTap: () => _getWeatherBloc.LoadWeather(
                          _controller.text,
                        ),
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(
                            child: Text("Найти"),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 600,
                  child: StreamBuilder(
                    stream: _getWeatherBloc.stream,
                    initialData: _getWeatherBloc.defaultitem,
                    builder: (BuildContext context,
                        AsyncSnapshot<WeatherModel> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data is WeatherModelInitState) {
                          return Container();
                        } else if (snapshot.data is WeatherModelInitState) {
                          return SpinKitDoubleBounce(
                            size: 60,
                            color: Colors.blue,
                          );
                        } else if (snapshot.data is WeatherModelOk) {
                          return Container(
                            child: Column(
                              children: [
                                Text("Температура: ${snapshot.data.temp}"),
                                Text(
                                    "Мин.температура: ${snapshot.data.min_temp}"),
                                Text(
                                    "Макс.температура: ${snapshot.data.max_temp}"),
                              ],
                            ),
                          );
                        }
                      }
                      return Container();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
