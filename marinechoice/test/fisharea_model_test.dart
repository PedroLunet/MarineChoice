import 'package:flutter_test/flutter_test.dart';
import 'package:marinechoice/models/protarea_model.dart';

void main() {
  group('ProtArea', () {
    test('fromJson and toJson work correctly', () {
      const protArea = ProtArea(
        idAreaP: 1,
        latitude: 12.34,
        longitude: 56.78,
        description: 'Test Description',
      );
      const protAreaJson = {
        'idAreaP': 1,
        'latitude': 12.34,
        'longitude': 56.78,
        'description': 'Test Description',
      };

      final protAreaFromJson = ProtArea.fromJson(protAreaJson);
      final protAreaToJson = protArea.toJson();

      expect(protAreaFromJson.idAreaP, protArea.idAreaP);
      expect(protAreaFromJson.latitude, protArea.latitude);
      expect(protAreaFromJson.longitude, protArea.longitude);
      expect(protAreaFromJson.description, protArea.description);

      expect(protAreaToJson['idAreaP'], protArea.idAreaP);
      expect(protAreaToJson['latitude'], protArea.latitude);
      expect(protAreaToJson['longitude'], protArea.longitude);
      expect(protAreaToJson['description'], protArea.description);
    });
  });
}