
import 'package:geolocator/geolocator.dart'; // Import correct package name
import 'dart:convert';
import 'package:geocoding/geocoding.dart';



import 'package:http/http.dart' as http;
import '../model/weather_model.dart';

class WeatherService {
  static const Base_url = 'https://api.openweathermap.org/';
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather_model> getWeather(String cityName) async {
    final response = await http.get(Uri.parse('$Base_url?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather_model.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<String> getCurrentCity() async {
    // Lấy quyền từ người dùng
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Lấy vị trí hiện tại
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placemarks[0].locality;

    return city ?? "";
  }
}


