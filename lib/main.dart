import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api_repository.dart';
import 'package:flutter_application_1/pages/WeatherScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:FirstPage(),
    );
  }
}

