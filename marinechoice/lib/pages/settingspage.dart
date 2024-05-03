import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marinechoice/auth/auth_service.dart';
import 'package:marinechoice/pages/loginpage.dart';

import 'homepage.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _auth = AuthService();
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffB4D8F9),
      appBar: buildAppBar(),
      body: body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50),
        alignment: Alignment.bottomCenter,

        child: const Text(
          'Settings',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w400,
          ),
        ),

      ),


      backgroundColor: const Color(0xffB4D8F9),
      actions: [
        GestureDetector(
          onTap: () {
            MaterialPageRoute(builder: (context) => const HomePage());
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: const BoxDecoration(

              color: Colors.transparent,
            ),
            child: SvgPicture.asset(
              'assets/icons/settings.svg',
              height: 37,
              width: 37,
            ),
          ),
        )
      ],
    );
  }


  SingleChildScrollView body() {
    return SingleChildScrollView(
      child: Column(
        children: [
      TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        padding: const EdgeInsets.all(40),
        textStyle: const TextStyle(fontSize: 25, fontFamily: 'Poppins'),
      ),
      onPressed: () async {
        _signout();
      },
      child: const Text("Sign Out"),
    )]
    ,
    )
    ,
    );
  }

  _signout() async {
    await _auth.signOut();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}