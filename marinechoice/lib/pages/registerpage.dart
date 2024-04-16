import 'package:flutter/material.dart';
import 'homepage.dart';
import "package:country_picker/country_picker.dart";

class RegisterPage extends StatelessWidget {
  const RegisterPage();

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

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
              const Text(
                'Register',
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
                    hintText: 'name',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: 'username',
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: DropdownButton<String>(
                  value: 'age',
                  onChanged: (String? newValue) {},
                  items: <String>['age', 'country1', 'country2', 'country3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      showCountryPicker(
                        context: context,
                        onSelect: (Country country) {
                          print('Select country: ${country.displayName}');
                        },
                      );
                    }, child: const Text('country'),
                  )
                ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: 'e-mail',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'password',
                  ),
                ),
              ),
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
                  backgroundColor: MaterialStateProperty.all(const Color(0xff5B92C6)),
                ),
                onPressed: () {
                  if (checkPassword()) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const HomePage()),
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
                    );
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
}
