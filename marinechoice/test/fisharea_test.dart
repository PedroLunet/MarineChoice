import 'package:flutter_test/flutter_test.dart';
import 'package:marinechoice/models/fisharea_model.dart';
import 'package:marinechoice/models/fish.dart';

void main() {
  group('FishArea model test', () {
    test('FishArea is correctly created from JSON', () {
      var json = {
        'idAreaF': 1,
        'latitude': 52.5200,
        'longitude': 13.4050,
        'fish': 1,
              };

      var fishArea = FishArea.fromJson(json);

      expect(fishArea.idAreaF, 1);
      expect(fishArea.latitude, 52.5200);
      expect(fishArea.longitude, 13.4050);
      expect(fishArea.fish.idFish, 1);
      expect(fishArea.fish.name, 'Tuna');
      expect(fishArea.fish.origin, 'Atlantic Ocean');
      expect(fishArea.fish.sustainabilityRate, 0.8);
      expect(fishArea.fish.avgPricePerKg, 20.0);
    });

    test('FishArea is correctly converted to JSON', () {
      var fish = Fish(
        idFish: 1,
        name: 'Tuna',
        origin: 'Atlantic Ocean',
        sustainabilityRate: 0.8,
        avgPricePerKg: 20.0,
      );

      var fishArea = FishArea(
        idAreaF: 1,
        latitude: 52.5200,
        longitude: 13.4050,
        fish: fish,
      );

      var json = fishArea.toJson();

      expect(json['idAreaF'], 1);
      expect(json['latitude'], 52.5200);
      expect(json['longitude'], 13.4050);
      expect(json['fish'], 1);

    });
  });
}