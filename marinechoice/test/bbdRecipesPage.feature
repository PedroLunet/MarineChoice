Feature: Recipes Page

  Scenario: User views recommended recipes
    Given the user is on the recipes page
    Then the user should see a list of recommended recipes

  Scenario: User taps on a recipe
    Given the user is on the recipes page
    When the user taps on a recipe
    Then the user should be navigated to the recipe information page

  Scenario: Navigation to different pages from bottom navigation bar
    Given the Home page is rendered
    When a different bottom navigation bar item is tapped
    Then the corresponding page should be navigated to

  Scenario: Navigation to Settings page from app bar
    Given the Home page is rendered
    When the settings icon in the app bar is tapped
    Then the Settings page should be navigated to