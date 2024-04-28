import 'dart:core';

class FishArea {
  String? key;
  FishAreaData? fishAreaData;

  FishArea({this.key, this.fishAreaData});
}

class FishAreaData {
  String? latitude;
  String? longitude;
  String? fish;

  FishAreaData({required this.latitude, required this.longitude,required this.fish});

  FishAreaData.fromJson(Map<dynamic, dynamic> json) {
    latitude = json["latitude"];
    longitude = json["longitude"];
    fish = json["fish"];
  }
}