Feature: User Registration

  Scenario: User registers successfully
    Given the user is on the registration page
    When the user fills in valid registration details
    And the user clicks the "Register" button
    Then the user should be redirected to the login page
    And a dialog should display with the message "Registration Successful"

  Scenario: User registration fails due to empty fields
    Given the user is on the registration page
    When the user leaves any required field empty
    And the user clicks the "Register" button
    Then an error message should be displayed indicating the empty fields

  Scenario: User registration fails due to password mismatch
    Given the user is on the registration page
    When the user fills in valid registration details
    And the user enters different passwords in the "Password" and "Confirm Password" fields
    And the user clicks the "Register" button
    Then an error message should be displayed indicating password mismatch

  Scenario: User registration fails due to existing email
    Given the user is on the registration page
    And there exists a user account with the same email address
    When the user fills in registration details with the existing email
    And the user clicks the "Register" button
    Then an error message should be displayed indicating the existing email address

  Scenario: User registration fails due to invalid email format
    Given the user is on the registration page
    When the user fills in registration details with an invalid email format
    And the user clicks the "Register" button
    Then an error message should be displayed indicating the invalid email format
