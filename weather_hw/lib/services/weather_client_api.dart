import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_hw/Model/weather_model.dart';

class WeatherApiClient {
  Future<Weather> getCurrentWeather(String? location) async {
    final uri = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=9a67572e02c54b69a15231720230706&q=$location");
    final request = await http.get(uri);
    final body = jsonDecode(request.body);

    print(Weather.fromJson(body).location.name); //location.name

    return Weather.fromJson(body);
  }
}
