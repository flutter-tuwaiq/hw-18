class Weather {
  String? temp;
  String? city;
  Weather({ this.temp, this.city,});

  Weather.fromJson(Map<String, dynamic> json) {
   
    temp = (json['main']["temp"] - 273.15).round().toString();
    city = json['name'];
 
  }

}