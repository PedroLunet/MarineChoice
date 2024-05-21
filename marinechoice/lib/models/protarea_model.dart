import 'dart:core';

class ProtArea {
  String? key;
  ProtAreaData? protAreaData;

  ProtArea({this.key, this.protAreaData});
}

class ProtAreaData {
  String? latitude;
  String? longitude;
  String? description;

  ProtAreaData(
      {required this.latitude,
      required this.longitude,
      required this.description});

  ProtAreaData.fromJson(Map<dynamic, dynamic> json, String language) {
    var data = json[language];
    latitude = json["latitude"];
    longitude = json["longitude"];
    description = json["description"];
  }
}
