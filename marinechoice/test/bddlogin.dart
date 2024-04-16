import 'package:bdd_framework/bdd_framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marinechoice/pages/loginpage.dart';

void main() {
  var feature = BddFeature('Logging in');

  Bdd(feature)
      .scenario('Login successful.')
      .given('The app is running')
      .when('The user presses the login button.')
      .then('The user gets sent to the homepage')
      .run((ctx) async {/*???*/});
}