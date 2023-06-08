

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

 String cityName = ' ';
  num tepp = 0;


Future getWether() async{
  
   //https://api.weatherapi.com/v1/current.json?key=bddee68d089f4a3282a195343230706&q=
   const String city = 'Jeddah';
   
 const baseUrl = "https://api.weatherapi.com/v1/current.json?key=bddee68d089f4a3282a195343230706&q=$city";
  final url = Uri.parse(baseUrl);
  final request = await  http.get(url);
  log(request.body);
  final jsonValue = jsonDecode(request.body);
  cityName = jsonValue['location']['name'];
  tepp = jsonValue['current']['temp_c'];

   

  

setState(() {
  
});


}

@override
  void initState() {
    getWether();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('wether'),
      ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text('Temp is  $tepp'.toString()),
                  Text(cityName),
                  
              
              ],
            ),
          ),
        ),
      );
  }
}