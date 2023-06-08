import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String? cityName;
  var weatherData;

  Future<void> fetchData() async {
    var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=ba000672e9726a3e301871dbac9aff0b');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        weatherData = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' My Weather'),
      ),

      body: Container(decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 138, 204, 237),
            const Color.fromARGB(255, 36, 170, 238)
          ]
      ),
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                onChanged: (value) => cityName = value,
      
                decoration: InputDecoration(
                  hintText: 'Enter city name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => fetchData(),
              child: Text('Get weather'),
            ),
            if (weatherData != null)
              ClipRRect(borderRadius: BorderRadius.circular(30),
                child: Container(height: 300,width: 300,     color: Colors.white,
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 20),
                      Text('Temp: ${weatherData['main']['temp']}C',
                      style: TextStyle(fontSize: 20,color: Colors.blue),),
                   
                      SizedBox(height: 10),
                      Text('clond: ${weatherData['main']['humidity']}',
                      style: TextStyle(fontSize: 20,color: Colors.blue),),
                      SizedBox(height: 10),
                      Text('Description: ${weatherData['weather'][0]['description']}',
                      style: TextStyle(fontSize: 20,color: Colors.blue),),
                    ],
                  ),
                ),
              ),
          ],
          
        ),
      ),
      bottomNavigationBar: ClipRRect(
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMMVgavHg0XV__lwMLVUjIs2yNXl47vcpMdw&usqp=CAU'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

