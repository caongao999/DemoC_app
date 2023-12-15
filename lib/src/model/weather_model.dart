import 'dart:ffi';

class Weather_model {
  final String cityName;   //khai báo các biến
  final Double temprature;
  final String mainCondition;

  Weather_model({
    required this.cityName,
    required this.temprature,
    required this.mainCondition,});//khai báo constructor

  factory Weather_model.fromJson(Map<String, dynamic> json) {
    return Weather_model(
      cityName: json['name'],
      temprature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }




}