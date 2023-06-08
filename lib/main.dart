
import 'package:flutter/material.dart';
import 'home_page.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App",
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Weather App" , style: TextStyle(color: Colors.black),),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          ),
          body:  const Home()
          ),
    );
  }
}

















