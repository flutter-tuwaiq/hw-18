import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api/models/city_info.dart';

class ApiService {
  static const String apiBaseUrl = 'https://api.weatherapi.com/v1/current.json?key=36bf494189584b349f584611230806&q=';
  Future<CityInfo> getCityInfo(String cityName) async {
    final uri = Uri.parse(apiBaseUrl + cityName);
    final request = await http.get(uri);
    final jsonBody = jsonDecode(request.body);
    final cityInfo = CityInfo.fromJson(jsonBody);
    return cityInfo;
  }
}
