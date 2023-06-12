import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../services/weather_service.dart';
import 'weather_screen.dart'; // Added import statement for WeatherScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _weatherService = WeatherService();
  final _cities = [
    'London',
    'Paris',
    'Tokyo',
    'New York',
    'Los Angeles',
    'Berlin',
    'Sydney',
    'Moscow',
    'Dubai',
    'Hong Kong',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: ListView.builder(
        itemCount: _cities.length,
        itemBuilder: (context, index) {
          final city = _cities[index];
          return ListTile(
            title: Text(city),
            onTap: () async {
              final weather = await _weatherService.getCurrentWeather(city);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WeatherScreen(weather: weather),
                ),
              );
            },
          );
        },
      ),
    );
  }
}