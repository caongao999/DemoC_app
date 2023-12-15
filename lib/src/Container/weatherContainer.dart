import 'package:flutter/material.dart';
import 'package:untitled1/src/model/weather_model.dart';
import 'package:untitled1/src/reponsitory/weather_service.dart';

class weatherContainer extends StatefulWidget {
  const weatherContainer({super.key});


  @override
  State<weatherContainer> createState() => _weatherContainerState();
}

class _weatherContainerState extends State<weatherContainer> {

  //api key
  final _weatherServece = WeatherService('7d54f9a5cdc4f6e63579c93be75d67c6');
  Weather_model? _weather;

  //fetch
  _fetchWeather() async {
    String cityName = await _weatherServece.getCurrentCity();
    //get weather for city
    try {
      final weather = await _weatherServece.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch

    (

    e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  //weather animation

}
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 370,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
    );
  }
