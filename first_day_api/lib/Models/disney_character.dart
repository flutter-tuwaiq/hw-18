class Weather {
  final String name;
  final double temperatureC;
  final double temperatureF;
  final String condition;
  final String iconsWeather;

  Weather({
    this.name ="",
    this.temperatureC = 0,
    this.temperatureF = 0,
    this.condition = "Sunny",
    this.iconsWeather = "",

  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json["location"]["name"],
      temperatureC: json['current']['temp_c'],
      temperatureF: json['current']['temp_f'],
      condition: json['current']['condition']['text'],
      iconsWeather: json['current']['condition']['icon'],
    );
  }
}