import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:homework_weather/weather_model.dart';
import '../constants/colors.dart';

class CardWeather extends StatelessWidget {
  const CardWeather({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weather.location!.region ?? '',
                style: const TextStyle(
                    color: whiteColor,
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Tajawal')),
            const SizedBox(
              height: 16,
            ),
            Stack(
              alignment: Alignment.bottomRight,
              clipBehavior: Clip.none,
              children: [
                GlassmorphicContainer(
                  width: 322,
                  height: 246,
                  borderRadius: 40,
                  linearGradient: const LinearGradient(
                      colors: [purple, blue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  border: 0,
                  blur: 5,
                  borderGradient: const LinearGradient(colors: [purple, blue]),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text(weather.current?.condition?.text ?? '',
                              style: const TextStyle(
                                  color: whiteColor,
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Tajawal')),
                          Text("${weather.current?.tempC}",
                              style: const TextStyle(
                                  color: whiteColor,
                                  fontSize: 100,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Tajawal')),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  child: Image.asset(
                    'images/Sun and Angled Rain Illustration.png',
                    height: 207,
                    width: 207,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
