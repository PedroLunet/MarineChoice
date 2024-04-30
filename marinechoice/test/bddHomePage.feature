Feature: Home Page Functionality

  Scenario: Home page displays welcome message
    Given the Home page is rendered
    Then a welcome message should be displayed

  Scenario: Read more functionality expands text container
    Given the Home page is rendered
    When the "Read more" button is clicked on a text container with long text
    Then the text container should expand to show the full text

  Scenario: Navigation to different pages from bottom navigation bar
    Given the Home page is rendered
    When a different bottom navigation bar item is tapped
    Then the corresponding page should be navigated to

  Scenario: Navigation to Settings page from app bar
    Given the Home page is rendered
    When the settings icon in the app bar is tapped
    Then the Settings page should be navigated to

  Scenario: User views information about marine sustainability
    Given the user is on the homepage
    Then the user should see information about marine sustainability
