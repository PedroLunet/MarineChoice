Feature: Recipe Information Page

  Scenario: User views recipe information
    Given the user is on the recipe information page
    Then the user should see the title, preparation, and author of the recipe

  Scenario: User navigates to different pages from bottom navigation bar
    Given the user is on the recipe information page
    When a different bottom navigation bar item is tapped
    Then the corresponding page should be navigated to

  Scenario: User navigates to settings page from app bar
    Given the user is on the recipe information page
    When the settings icon in the app bar is tapped
    Then the settings page should be navigated to
