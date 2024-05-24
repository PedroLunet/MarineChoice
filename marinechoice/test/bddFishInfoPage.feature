Feature: Fish Information Page
  As a user,
  I want to view detailed information about a specific fish
  So that I can learn more about it

  Background:
    Given I am on the Home Page

  Scenario: View Fish Information Page
    Given I navigate to the Fish Information Page for a fish
    Then I should see the page background color as "#B4D8F9"
    And I should see the AppBar with title "MarineChoice"
    And I should see the fish name a fish displayed
    And I should see the fish origin displayed
    And I should see the fish image
    And I should see the "Fun Fact!" section with the fact text
    And I should see the "Average price per kilogram" section with the price text
    And I should see the "Sustainability Rate" section with the sustainability badge

  Scenario: Navigate through Bottom Navigation Bar
    Given I am on the Fish Information Page for a fish
    When I tap on the Home icon in the Bottom Navigation Bar
    Then I should be navigated to the Home Page
    When I tap on the Fish icon in the Bottom Navigation Bar
    Then I should be navigated to the Fish Page
    When I tap on the Cook icon in the Bottom Navigation Bar
    Then I should be navigated to the Recipes Page
    When I tap on the Map icon in the Bottom Navigation Bar
    Then I should be navigated to the Map Page
    When I tap on the Post icon in the Bottom Navigation Bar
    Then I should be navigated to the Post Page
    When I tap on the User icon in the Bottom Navigation Bar
    Then I should be navigated to the User Profile Page

  Scenario: Navigate to Settings Page
    Given I am on the Fish Information Page for a fish
    When I tap on the Settings icon in the AppBar
    Then I should be navigated to the Settings Page
