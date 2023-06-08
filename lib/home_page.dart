import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Model/Weather.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

 
  var city;
  var temp;

  Future getWeather() async {
    final Url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=riyadh&lon={lon}&appid=e13633ea81194c12732cbaad057c5b38");
    http.Response response = await http.get(Url);
    final result = await jsonDecode(response.body);
    final weather = Weather.fromJson(result);
    setState(() {
      temp = weather.temp ;
      city = weather.city;
    });
  }

  
  @override
  void initState() {
    super.initState();
    getWeather();
  }
  

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      
      body: Container(
          decoration: const BoxDecoration(
          image: DecorationImage(
           image: AssetImage("lib/assets/cloudy.png"),
          fit: BoxFit.cover,
          ),
          ),
          
      child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       
       children: [
        SizedBox(height: 60),
         Container(
           height: 300,
          //  color: const Color.fromARGB(255, 7, 168, 255),
           child: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
               
                 Padding(
                   padding: const EdgeInsets.only(bottom: 8.0),
                   
                   child: Text(
                     city ?? "Loading",
                     style: const TextStyle(
                         color: Colors.white,
                         fontSize: 49,
                         fontWeight: FontWeight.w600),
                   ),
                 ),
                 Text(
                   temp ?? "Loading",
                   style: const TextStyle(color: Colors.white , fontSize: 28),
                 )
               ],
             ),
           ),
         ),
       ],
        ),
      ),
    );
  }

}
