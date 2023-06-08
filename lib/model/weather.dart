import 'dart:convert';
import 'package:http/http.dart' as http;

class Weather {
  final String cityName;
  final double temperature;
  final String description;
  

  Weather({required this.cityName, required this.temperature, required this.description});

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weatherData = json['weather'][0];
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'],
      description: weatherData['description'],
      
    );
  }
}