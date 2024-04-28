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

  ProtAreaData({required this.latitude, required this.longitude,required this.description});

  ProtAreaData.fromJson(Map<dynamic, dynamic> json) {
    latitude = json["latitude"];
    longitude = json["longitude"];
    description = json["description"];
  }
}