import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:homework_weather/constants/colors.dart';
import '../components/card_future_weather.dart';
import '../components/card_weather.dart';
import '../weather_model.dart';
import 'package:http/http.dart' as http;

List<WeatherModel> makkahWeather = [];

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Future getWeatherData() async {
    const baseUrl =
        'http://api.weatherapi.com/v1/forecast.json?key=bfbec9f69f8e4d15a81164944230706&q=makkah&days=1&aqi=no&alerts=no';
    final uri = Uri.parse(baseUrl);
    final request = await http.get(uri);
    final jsonValue = jsonDecode(request.body); //json
    final weather = WeatherModel.fromJson(jsonValue); //json to model

    makkahWeather.add(weather);

    setState(() {});
  }

  @override
  void initState() {
    getWeatherData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final w in makkahWeather) CardWeather(weather: w),
                SizedBox(height: 80),
                FutureWeather()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
