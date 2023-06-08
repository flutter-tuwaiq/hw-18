import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hw_18/models/city_weather.dart';

class WeatherApi {
  static String baseUrl = 'open-weather13.p.rapidapi.com';

  static Map<String, String> headers = {
    'X-RapidAPI-Key': 'adcfdd1d46msh710a7d50cf21736p178a24jsnddbfc464bedc',
    'X-RapidAPI-host': 'open-weather13.p.rapidapi.com',
  };

  static Future<CityWeather> getCityWeather(String city) async {
    final url = Uri(scheme: 'https', host: baseUrl, path: '/city/$city');
    final response = await http.get(url, headers: headers);
    final result = jsonDecode(response.body);
    final cityWeather = CityWeather.fromJson(result);

    return cityWeather;
  }
}
