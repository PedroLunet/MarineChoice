import 'dart:core';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:marinechoice/models/user.dart';

import 'fish.dart';

class FishArea {
  final int? idAreaF;
  final double latitude;
  final double longitude;
  final Fish fish;

  const FishArea({required this.idAreaF, required this.latitude, required this.longitude,required this.fish});

  factory FishArea.fromJson(Map<String, dynamic> json) => FishArea (
    idAreaF: json['idAreaF'],
    latitude: json['latitude'],
    longitude: json['longitude'],
    fish: Fish(idFish: json['idFish'], name: json['name'], origin: json['origin'], sustainabilityRate: json['sustainabilityRate'], avgPricePerKg: json['avgPricePerKg'], ),
  );

  Map<String, dynamic> toJson() => {
    'idAreaF' : idAreaF,
    'latitude' : latitude,
    'longitude' : longitude,
    'fish' : fish.toJson()
  };

}