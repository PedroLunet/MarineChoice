Feature: Authentication Wrapper Widget Functionality

  Scenario: Loading indicator is displayed while waiting for authentication state
    Given the Wrapper widget is rendered
    When the authentication state stream is in waiting state
    Then a loading indicator should be displayed

  Scenario: Error message is displayed if authentication state stream encounters an error
    Given the Wrapper widget is rendered
    When the authentication state stream encounters an error
    Then an error message should be displayed

  Scenario: Login page is displayed if user is not authenticated
    Given the Wrapper widget is rendered
    When the authentication state indicates that the user is not authenticated
    Then the login page should be displayed

  Scenario: Home page is displayed if user is authenticated
    Given the Wrapper widget is rendered
    When the authentication state indicates that the user is authenticated
    Then the home page should be displayed
