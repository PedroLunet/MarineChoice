import 'dart:core';

class Fish {
  String? key;
  FishData? fishData;

  Fish({this.key, this.fishData});

}

class FishData {
  String? avgPricePerKg;
  String? facts;
  String? name;
  String? origin;
  String? sustainabilityRate;
  String? imagePath;


  FishData(
      {required this.avgPricePerKg,
        required this.facts,
        required this.name,
        required this.origin,
        required this.sustainabilityRate,
        required this.imagePath,});

  FishData.fromJson(Map<dynamic, dynamic> json) {
    avgPricePerKg = json["avgPricePerKg"];
    facts = json["facts"];
    name = json["name"];
    origin = json["origin"];
    sustainabilityRate = json["sustainabiltyRate"];
    imagePath = json["imagePath"];
  }

}
