Feature: Firebase Initialization in Flutter App

  Scenario: Firebase is initialized successfully
    Given the Flutter application is launched
    When the application initializes Firebase
    Then Firebase should be initialized without any errors

  Scenario: Firebase initialization options are correctly set
    Given the Firebase initialization is triggered
    When the initialization options are provided
    Then the correct API key, app ID, messaging sender ID, project ID, and storage bucket should be configured

  Scenario: Wrapper widget is displayed as the home screen
    Given the Flutter application is launched
    When the home screen is rendered
    Then the Wrapper widget should be displayed

  Scenario: Theme font is set to 'Poppins'
    Given the Flutter application is launched
    When the theme is configured
    Then the font family should be set to 'Poppins'

  Scenario: Debug banner is hidden
    Given the Flutter application is launched
    When the debug mode is disabled
    Then the debug banner should be hidden

  Scenario: Firebase initialization fails due to missing options
    Given the Flutter application is launched
    When the Firebase initialization is triggered without providing required options
    Then an error should occur

  Scenario: Firebase initialization fails due to invalid options
    Given the Flutter application is launched
    When the Firebase initialization is triggered with invalid options
    Then an error should occur

  Scenario: Wrapper widget functionality is tested
    Given the Wrapper widget is rendered
    When various scenarios are tested (e.g., user authentication, data fetching, etc.)
    Then the Wrapper widget should handle each scenario correctly

  Scenario: ThemeData is configured properly
    Given the Flutter application is launched
    When the ThemeData is configured
    Then the specified theme properties should be set correctly

  Scenario: Firebase initialization is asynchronous
    Given the Firebase initialization is triggered
    When the initialization process is asynchronous
    Then the application should wait for Firebase initialization to complete before proceeding

  Scenario: Debug mode banner behavior is tested
    Given the Flutter application is launched
    When the debug mode is enabled/disabled
    Then the debug banner should appear/disappear accordingly
