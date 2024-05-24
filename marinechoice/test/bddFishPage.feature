Feature: Fish Page Functionality
  As a user,
  I want to view a list of fish and their sustainability ratings
  So that I can make informed choices about seafood consumption

  Background:
    Given I am on the Home Page

  Scenario: View Fish List
    Given I navigate to the Fish Page
    Then I should see the page background color as "#B4D8F9"
    And I should see the AppBar with title "MarineChoice"
    And I should see the list of fish with their names, images, and sustainability ratings

  Scenario: Navigate through Bottom Navigation Bar
    Given I am on the Fish Page
    When I tap on the Home icon in the Bottom Navigation Bar
    Then I should be navigated to the Home Page
    When I tap on the Fish icon in the Bottom Navigation Bar
    Then I should stay on the Fish Page
    When I tap on the Cook icon in the Bottom Navigation Bar
    Then I should be navigated to the Recipes Page
    When I tap on the Map icon in the Bottom Navigation Bar
    Then I should be navigated to the Map Page
    When I tap on the Post icon in the Bottom Navigation Bar
    Then I should be navigated to the Post Page
    When I tap on the User icon in the Bottom Navigation Bar
    Then I should be navigated to the User Profile Page

  Scenario: Navigate to Settings Page
    Given I am on the Fish Page
    When I tap on the Settings icon in the AppBar
    Then I should be navigated to the Settings Page
