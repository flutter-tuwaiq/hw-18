class wither {
  wither({
    required this.location,
    required this.current,
  });
  late final Location location;
  late final Current current;
  
  wither.fromJson(Map<String, dynamic> json){
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
    
  });
  late final String name;
 
  Location.fromJson(Map<String, dynamic> json){
    name = json['name'];
    
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
   
    return _data;
  }
}

class Current {
  Current({
   
    required this.tempC,
   
  });
  
  late final int tempC;
 
  
  Current.fromJson(Map<String, dynamic> json){
   
    tempC = json['temp_c'];
   
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    
    _data['temp_c'] = tempC;
    
    return _data;
  }
}

class Condition {
  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });
  late final String text;
  late final String icon;
  late final int code;
  
  Condition.fromJson(Map<String, dynamic> json){
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    _data['icon'] = icon;
    _data['code'] = code;
    return _data;
  }
}