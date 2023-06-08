/*class Weather {
  String? cityname;
  double? temp;
  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;

  Weather(
      {this.cityname,
      this.temp,
      this.wind,
      this.humidity,
      this.feels_like,
      this.pressure});

  Weather.fromJson(Map<String, dynamic> json) {
    cityname = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    pressure = json["main"]["pressure"];
    humidity = json["main"]["humidity"];
    feels_like = json["main"]["feels_like"];
  }
}*/

class Weather {
  Weather({
    required this.location,
    required this.current,
  });
  late final Location location;
  late final Current current;
  
  Weather.fromJson(Map<String, dynamic> json){
    location = Location.fromJson(json['location']);
    current = Current.fromJson(json['current']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['location'] = location.toJson();
    _data['current'] = current.toJson();
    return _data;
  }
}

class Location {
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.tzId,
    required this.localtime,
  });
  late final String name;
  late final String region;
  late final String country;
  late final String tzId;
  late final String localtime;
  
  Location.fromJson(Map<String, dynamic> json){
    name = json['name'];
    region = json['region'];
    country = json['country'];
    tzId = json['tz_id'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['region'] = region;
    _data['country'] = country;
    _data['tz_id'] = tzId;
    _data['localtime'] = localtime;
    return _data;
  }
}

class Current {
  Current({
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
  });
  late final String lastUpdated;
  late final int tempC;
  late final double tempF;
  late final int isDay;
  late final Condition condition;
  late final double windMph;
  late final double windKph;
  late final int windDegree;
  late final String windDir;
  late final int pressureMb;
  late final double pressureIn;
  late final double precipMm;
  late final int humidity;
  late final int cloud;
  late final double feelslikeC;
  late final double feelslikeF;
  late final int visKm;
  late final int visMiles;
  
  Current.fromJson(Map<String, dynamic> json){
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = Condition.fromJson(json['condition']);
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['last_updated'] = lastUpdated;
    _data['temp_c'] = tempC;
    _data['temp_f'] = tempF;
    _data['is_day'] = isDay;
    _data['condition'] = condition.toJson();
    _data['wind_mph'] = windMph;
    _data['wind_kph'] = windKph;
    _data['wind_degree'] = windDegree;
    _data['wind_dir'] = windDir;
    _data['pressure_mb'] = pressureMb;
    _data['pressure_in'] = pressureIn;
    _data['precip_mm'] = precipMm;
    _data['humidity'] = humidity;
    _data['cloud'] = cloud;
    _data['feelslike_c'] = feelslikeC;
    _data['feelslike_f'] = feelslikeF;
    _data['vis_km'] = visKm;
    _data['vis_miles'] = visMiles;
    return _data;
  }
}

class Condition {
  Condition({
    required this.text,
  });
  late final String text;
  
  Condition.fromJson(Map<String, dynamic> json){
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    return _data;
  }
}