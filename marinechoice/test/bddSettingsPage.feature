Feature: Settings Page

  Scenario: User signs out from the Settings page
    Given the user is on the Settings page
    When the user taps on the "Sign Out" button
    Then the user should be signed out
    And the user should be redirected to the login page
