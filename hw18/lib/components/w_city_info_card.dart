import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_api/models/city_info.dart';

class WCityInfoCard extends StatelessWidget {
  const WCityInfoCard({super.key, required this.info});

  final CityInfo info;

  @override
  Widget build(BuildContext context) {
    var color;
    if (info.current?.condition?.icon ==
        "//cdn.weatherapi.com/weather/64x64/night/113.png") {
      color = Color.fromARGB(156, 51, 0, 205);
    } else if (info.current?.condition?.icon ==
        "//cdn.weatherapi.com/weather/64x64/day/113.png") {
      color = Color.fromARGB(199, 0, 206, 243);
    } else if (info.current?.condition?.icon ==
        "//cdn.weatherapi.com/weather/64x64/day/143.png") {
      color = Color.fromARGB(143, 172, 172, 172);
    }

    final textStyle = TextStyle(
        color: const Color.fromARGB(255, 255, 255, 255),
        fontWeight: FontWeight.w400,
        fontSize: 16);
    final imgUrl = info.current?.condition?.icon.toString();
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color,
          ),
          height: 140,
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${info.location?.name}',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateTime.parse(
                                '${info.location?.localtime ?? "12:00"}:00')
                            .getTimeFrom,
                        style: textStyle,
                      ),
                    ],
                  ),
                  Text(
                    '${info.current?.condition?.text}',
                    style: textStyle,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${info.current?.tempC}°',
                    style: TextStyle(fontSize: 40),
                  ),
                  Image(
                      width: 70,
                      height: 70,
                      image: NetworkImage("http:${imgUrl}")),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

extension WDateTimeToString on DateTime {
  String get getTimeFrom => DateFormat('kk:mm').format(this);
}
