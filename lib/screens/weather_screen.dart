import 'package:flutter/material.dart';

import '../Model/weather.dart';



class WeatherScreen extends StatelessWidget {
  final Weather weather;

  const WeatherScreen({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(weather.city),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(weather.iconUrl),
          Text('${weather.temperature}°C', style: TextStyle(fontSize: 48)),
          Text(weather.description, style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}