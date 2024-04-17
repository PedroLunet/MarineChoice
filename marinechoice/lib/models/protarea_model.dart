import 'dart:core';

class ProtArea {
  final int? idAreaP;
  final double latitude;
  final double longitude;
  final String description;

  const ProtArea({required this.idAreaP, required this.latitude, required this.longitude,required this.description});

  factory ProtArea.fromJson(Map<String, dynamic> json) => ProtArea (
    idAreaP: json['idAreaP'],
    latitude: json['latitude'],
    longitude: json['longitude'],
    description: json['description'],
  );

  Map<String, dynamic> toJson() => {
    'idAreaP' : idAreaP,
    'latitude' : latitude,
    'longitude' : longitude,
    'description' : description
  };

}