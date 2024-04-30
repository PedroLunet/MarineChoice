Feature: Map Page Functionality

  Scenario: User views the map with current location
    Given the user is on the map page
    When the map page is loaded
    Then the user should see the map with their current location

  Scenario: User views protected areas on the map
    Given the user is on the map page
    When the map page is loaded
    Then the user should see markers representing protected areas on the map

  Scenario: User views fishing areas on the map
    Given the user is on the map page
    When the map page is loaded
    Then the user should see markers representing fishing areas on the map

  Scenario: User navigates to different pages from bottom navigation bar
    Given the user is on the map page
    When a different bottom navigation bar item is tapped
    Then the corresponding page should be navigated to

  Scenario: User navigates to settings page from app bar
    Given the user is on the map page
    When the settings icon in the app bar is tapped
    Then the settings page should be navigated to
