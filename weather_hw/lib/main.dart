import 'package:flutter/material.dart';
import 'package:weather_hw/Model/weather_model.dart';
import 'package:weather_hw/services/weather_client_api.dart';
import 'package:weather_hw/views/Additional_weather.dart';
import 'package:weather_hw/views/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherApiClient client = WeatherApiClient();

  /*@override
  void initState() {
    super.initState();
    client.getCurrentWeather("Riyadh");
  }*/

  Weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather("London");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(153, 197, 229, 252),
          elevation: 0.0,
          title: Text(
            "Weather",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  currentWeather(Icons.wb_sunny_rounded,
                      "${data!.current.tempC}", "${data!.location.name}"),
                  SizedBox(
                    height: 60,
                  ),
                  const Text(
                    "Additional Information",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  SizedBox(
                    height: 20.0,
                  ),
                  AdditionalInformation(
                      "${data!.current.windKph}",
                      "${data!.current.humidity}",
                      "${data!.current.pressureIn}",
                      "${data!.current.feelslikeC}"),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        )

        /*Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            currentWeather(Icons.wb_sunny_rounded, "23", "Riyadh"),
            SizedBox(
              height: 60,
            ),
            const Text(
              "Additional Information",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Divider(),
            SizedBox(
              height: 20.0,
            ),
            AdditionalInformation("657", "456", "346", "456"),
          ],
        )*/

        );
  }
}
