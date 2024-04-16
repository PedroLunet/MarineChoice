import 'package:flutter/material.dart';
import 'package:marinechoice/pages/homepage.dart';
import 'package:marinechoice/pages/loginpage.dart';
import 'package:sqflite/sqflite.dart';

import 'dbhelperfilters.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const LoginPage(),

    );
  }
}

