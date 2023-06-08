import 'package:flutter/material.dart';

import '../Models/disney_character.dart';
import '../components/card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  WeatherService weatherService = WeatherService();
  Weather weather = Weather();

  String currentWeather = "";
  double tempC = 0;
  double tempF = 0;
  String iconWeather = "";
  String contryname = "";

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  void getWeather() async {

    // her select the city and run 
    weather = await weatherService.getWeatherData("Jeddah");

    setState(() {
      contryname = weather.name;
      currentWeather = weather.condition;
      tempF = weather.temperatureF;
      tempC = weather.temperatureC;
      iconWeather = weather.iconsWeather;
    });
    print(weather.temperatureC);
    print(weather.temperatureF);
    print(weather.condition);
    print(weather.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              contryname,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 64,
            ),
            Text(
              currentWeather,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "${tempC.toString()}C",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "${tempF.toString()}F",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
