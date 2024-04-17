
import 'dart:ffi';

class Fish{

  final int? idFish;
  final String? name;
  final String? origin;
  final double sustainabilityRate;
  final double avgPricePerKg;

  /* idFish integer PRIMARY KEY AUTOINCREMENT,
    name varchar(50),
    origin varchar(100),
    sustainabilityRate float,
    avgPricePerKg float*/

  Fish({required this.idFish, required this.name, required this.origin, required this.sustainabilityRate, required this.avgPricePerKg});

  factory Fish.fromJson(Map<String, dynamic> json) => Fish (
    idFish: json['idFish'],
    name: json['name'],
    origin: json['origin'],
    sustainabilityRate: json['sustainabilityRate'],
    avgPricePerKg: json['avgPricePerKg'],
  );

  Map<String, dynamic> toJson() => {
    'idFish' : idFish,
    'name' : name,
    'origin' : origin,
    'sustainabilityRate' : sustainabilityRate,
    'avgPricePerKg' : avgPricePerKg,
  };

}