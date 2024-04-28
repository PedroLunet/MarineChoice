import 'package:flutter_test/flutter_test.dart';

void main() {
group('Fish model test', () {
    test('Fish is correctly created from JSON', () {
      var json = {
        'idFish': 1,
        'name': 'Tuna',
        'origin': 'Atlantic Ocean',
        'sustainabilityRate': 0.8,
        'avgPricePerKg': 20.0,
      };

      var fish = Fish.fromJson(json);

      expect(fish.idFish, 1);
      expect(fish.name, 'Tuna');
      expect(fish.origin, 'Atlantic Ocean');
      expect(fish.sustainabilityRate, 0.8);
      expect(fish.avgPricePerKg, 20.0);
    });

    test('Fish is correctly converted to JSON', () {
      var fish = Fish(
        idFish: 1,
        name: 'Tuna',
        origin: 'Atlantic Ocean',
        sustainabilityRate: 0.8,
        avgPricePerKg: 20.0,
      );

      var json = fish.toJson();

      expect(json['idFish'], 1);
      expect(json['name'], 'Tuna');
      expect(json['origin'], 'Atlantic Ocean');
      expect(json['sustainabilityRate'], 0.8);
      expect(json['avgPricePerKg'], 20.0);
    });
  });
}
