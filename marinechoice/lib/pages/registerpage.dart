import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:marinechoice/auth/auth_service.dart';
import 'package:marinechoice/pages/loginpage.dart';
import 'package:country_list_pick/country_list_pick.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = AuthService();

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  String _ageinit = '1';

  List<String> _items() {
    return List.generate(99, (index) => (index + 1).toString());
  }



  @override
  Widget build(BuildContext context) {

    bool checkPassword() {
      String password = passwordController.text;
      String confirm = confirmPasswordController.text;
      return password == confirm;
    }

    return Scaffold(
      body: Container(
        color: Colors.blue[100],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Marine Choice',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Register',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: DropdownButton<String>(
                  value: _ageinit,
                  icon: const Icon(Icons.arrow_downward),
                  onChanged: (String? newValue) {
                    setState(() {
                      _ageinit = newValue!;
                    }
                    );
                  },
                  items: _items().map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              ),
              const SizedBox(height: 2),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: CountryListPick(
                  theme: CountryTheme(
                    isShowFlag: true,
                    isShowTitle: true,
                    isShowCode: false,
                    isDownIcon: true,
                    showEnglishName: true,
                  ),
                  onChanged: (CountryCode? code) {
                    print(code!.name);
                  },
                ),
              ),
              const SizedBox(height: 2),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'E-mail',
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'confirm password',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(const Color(0xff5B92C6)),
                ),
                onPressed: () {
                  if (checkPassword()) {
                    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                    _signup();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Registration Successful'),
                          content: const Text('You have successfully registered.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );}
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('E-mail or password fields are empty.'),
                        ),
                      );
                    }
                  } else {
                    // Handle password mismatch error
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Passwords do not match.'),
                      ),
                    );
                  }
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _signup() async{
    final user = await _auth.createUserWithEmailAndPassword(emailController.text, passwordController.text);

    if(user != null) {
      log("User Created Successfully");
    }
  }
}
