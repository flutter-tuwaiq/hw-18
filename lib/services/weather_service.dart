import 'dart:convert';
import 'dart:math';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../Model/weather.dart';



class WeatherService {
  static const baseUrl = 'http://api.weatherapi.com/v1';
  static const apiKey = String.fromEnvironment('WEATHER_API_KEY');

  Future<Weather> getCurrentWeather(String city) async {
    final url = '$baseUrl/current.json?key=$apiKey&q=$city';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    print(response.body);
    return Weather.fromJson(json);
  }
}