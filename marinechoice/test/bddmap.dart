import 'package:bdd_framework/bdd_framework.dart';

void main() {
  var feature = BddFeature('MapPage widget');

  Bdd(feature)
      .scenario('MapPage loading')
      .given('The app is running')
      .when('The user opens the map page')
      .then('The user sees a loading message')
      .run((ctx) async {});

  Bdd(feature)
      .scenario('MapPage map')
      .given('The app is running')
      .when('The user opens the map page')
      .then('The user sees a map')
      .run((ctx) async {});

  Bdd(feature)
      .scenario('MapPage location')
      .given('The app is running')
      .when('The user opens the map page')
      .then('The user sees their current location')
      .run((ctx) async {});

  Bdd(feature)
      .scenario('MapPage markers')
      .given('The app is running')
      .when('The user opens the map page')
      .then('The user sees a marker on their current location')
      .run((ctx) async {});

  Bdd(feature)
      .scenario('MapPage location updates')
      .given('The app is running')
      .when('The user is moving and opens the map page')
      .then('The user sees their location updating')
      .run((ctx) async {});

  Bdd(feature)
      .scenario('MapPage location permission')
      .given('The app is running')
      .when('The user opens the map page')
      .then('The user sees a permission request')
      .run((ctx) async {});

  Bdd(feature)
      .scenario('MapPage location service')
      .given('The app is running')
      .when('The user opens the map page')
      .then('The user sees a service request')
      .run((ctx) async {});

  Bdd(feature)
      .scenario('Maps and direction shortcuts')
      .given('The app is running')
      .when('The user clicks on the marker')
      .then('The user sees 2 buttons on the right bottom corner')
      .run((ctx) async {});

  Bdd(feature)
      .scenario(
      'Clicking on Google Maps button, having google maps installed')
      .given('The app is running')
      .when('The user clicks on the Google Maps button')
      .then(
      'The user is redirected to Google Maps and sees the marker on the app')
      .run((ctx) async {});

  Bdd(feature)
      .scenario('Clicking on directions button, having google maps installed')
      .given('The app is running')
      .when('The user clicks on the directions button')
      .then(
      'The user is redirected to Google Maps and gets directions to the marker')
      .run((ctx) async {});

  Bdd(feature)
      .scenario(
      'Clicking on Google Maps button, not having google maps installed')
      .given('The app is running')
      .when('The user clicks on the Google Maps button')
      .then(
      'The user sees a message telling that Google Maps is either not installed or disabled')
      .run((ctx) async {});

  Bdd(feature)
      .scenario(
      'Clicking on directions button, not having google maps installed')
      .given('The app is running')
      .when('The user clicks on the directions button')
      .then(
      'The user sees a message telling that Google Maps is either not installed or disabled')
      .run((ctx) async {});

  Bdd(feature)
      .scenario('Clicking on the  +  button')
      .given('The app is running')
      .when('The user clicks on the  +  button')
      .then('The map gets zoomed in')
      .run((ctx) async {});

  Bdd(feature)
      .scenario('Clicking on the  -  button')
      .given('The app is running')
      .when('The user clicks on the  -  button')
      .then('The map gets zoomed out')
      .run((ctx) async {});

  Bdd(feature)
    .scenario('The user clicks and drags the map')
    .given('The app is running')
    .when('The user clicks and drags the map')
    .then('The user sees the map moving')
    .run((ctx) async {});
}
