import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;


  Future<User?> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password : password);
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', name);
      return cred.user;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<User?> logInUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', cred.user!.displayName!);

      return cred.user;
    } catch (e) {
      log("Something went wrong");
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('username');
    } catch (e) {
      log("Something went wrong");
    }
  }
}
