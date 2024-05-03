import 'package:bdd_framework/bdd_framework.dart';
//import 'package:bdd_widget_test/bdd_widget_test.dart';

void main() {
  var feature = BddFeature('Logging in');

  Bdd(feature)
      .scenario('Login successful.')
      .given('The app is running')
      .when('The user presses the login button.')
      .then('The user gets sent to the homepage')
      .run((ctx) async {
    // Clean up or perform any final checks.
    // For example:
    //await ctx.world.tearDownApp();
  });
}
