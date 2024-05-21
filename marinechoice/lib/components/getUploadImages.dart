import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/recipe_model.dart';
import '../globals.dart' as globals;
//FirebaseStorage firebaseStorage = FirebaseStorage.instanceFor(bucket: 'gs://marinechoice-b17c9.appspot.com');

Reference get firebaseStorage => FirebaseStorage.instanceFor().ref();
Future<String?> getImage(String? imagePath) async {
  if (kDebugMode) {
    print(imagePath);
  }
  try {
    Reference urlRef =
        firebaseStorage.child(globals.selectedLanguage).child('${imagePath}');
    var imgUrl = await urlRef.getDownloadURL();
    return imgUrl;
  } catch (e) {
    if (kDebugMode) {
      print("Failed to get image URL: $e");
    }
    return null;
  }
}
