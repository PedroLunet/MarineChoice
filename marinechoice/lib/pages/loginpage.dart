import 'package:flutter/material.dart';
import 'package:marinechoice/auth/auth_service.dart';

import 'homepage.dart';
import 'registerpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void registerPressed() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const RegisterPage()));
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
              const Text(
                'Login',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'E-mail',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                  obscureText: true, // Mask the password input
                ),
              ),
              const SizedBox(height: 25),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[200]!),
                  side: MaterialStateProperty.all<BorderSide>(BorderSide(width: 0, color: Colors.blue[300]!)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                ),
                onPressed: () async {
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    _login();
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('E-mail or password fields are empty.'),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.blue[900]!),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[200]!),
                  side: MaterialStateProperty.all<BorderSide>(BorderSide(width: 0, color: Colors.blue[300]!)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                ),
                onPressed: registerPressed,
                child: Text('Register',
                    style: TextStyle(color: Colors.blue[900]!),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _login() async {
    final user = await _auth.logInUserWithEmailAndPassword(
        emailController.text, passwordController.text);

    if (user != null) {
      log("User logged in successfully!");
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomePage()));
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('E-mail or password do not match.'),
        ),
      );
    }
  }
}