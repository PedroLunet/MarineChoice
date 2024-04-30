Feature: User Authentication

  Scenario: User logs in with valid credentials
    Given the user is on the login page
    When valid email and password are entered
    Then the user should be logged in and redirected to the home page

  Scenario: User attempts to log in with empty email or password
    Given the user is on the login page
    When the login button is pressed with empty email or password fields
    Then an error message should be displayed

  Scenario: User attempts to log in with invalid credentials
    Given the user is on the login page
    When invalid email or password are entered
    Then an error message should be displayed