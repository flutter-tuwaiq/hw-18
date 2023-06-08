class Weather {
  final String city;
  final double temperature;
  final String description;
  final String iconUrl;

  Weather({
    required this.city,
    required this.temperature,
    required this.description,
    required this.iconUrl,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final current = json['current'];
    final location = json['location'];
    return Weather(
      city: location['name'],
      temperature: current['temp_c'].toDouble(),
      description: current['condition']['text'],
      iconUrl: 'http:${current['condition']['icon']}',
    );
  }
}