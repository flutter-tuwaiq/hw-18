import 'package:flutter/material.dart';
import 'package:hw_18/models/city_weather.dart';
import 'package:hw_18/network/weather_api.dart';
import 'package:weather_animation/weather_animation.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final pageController = PageController();
  final iconcode = '';
  late  CityWeather city;

  List<String> cities = ['riyadh', 'dammam', 'jeddah'];

  @override
  void initState() {
    super.initState();
    _loadCityWeather();
  }

  void _loadCityWeather() async {
    city = await WeatherApi.getCityWeather(cities[0]);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildCityWidget(CityWeather city) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade800,
                  Colors.blue.shade200,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(city.name!,
                  style:  TextStyle(fontSize: 35, color: Colors.white)),
              Text(
                '${city.main!.temp} F',
                style:  TextStyle(fontSize: 35, color: Colors.white),
              ),
            ],
          ),
           CloudWidget(),
        ],
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: city == null
            ?  Center(child: CircularProgressIndicator())
            : PageView.builder(
                scrollDirection: Axis.vertical,
                controller: pageController,
                itemBuilder: (context, index) {
                  return _buildCityWidget(city);
                },
                itemCount: cities.length,
                onPageChanged: (pageIndex) async {
                  city = await WeatherApi.getCityWeather(cities[pageIndex]);
                  setState(() {});
                },
              ),
      ),
    );
  }
}
