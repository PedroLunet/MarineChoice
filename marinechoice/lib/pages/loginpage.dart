import 'package:flutter/material.dart';

import 'homepage.dart';
import 'registerpage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void loginPressed() {
      String username = usernameController.text;
      String password = passwordController.text;
      print('Username: $username, Password: $password');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HomePage()));
    }

    void registerPressed() {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const RegisterPage()));
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
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: 'Username',
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: loginPressed,
                child: const Text('Login'),
              ),
              ElevatedButton(
                onPressed: registerPressed,
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}