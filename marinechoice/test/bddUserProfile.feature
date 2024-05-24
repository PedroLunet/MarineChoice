Feature: User Profile Functionality
  As a user,
  I want to view my profile information and the recipes I've posted
  So that I can manage my profile and view my contributions

  Background:
    Given I am on the Home Page

  Scenario: View User Profile
    Given I navigate to the User Profile Page
    Then I should see the page background color as "#B4D8F9"
    And I should see the AppBar with title "MarineChoice"
    And I should see a greeting message with my username
    And I should see a message indicating that I've posted recipes
    And I should see the recipes I've posted

  Scenario: Navigate through Bottom Navigation Bar
    Given I am on the User Profile Page
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
    Then I should stay on the User Profile Page

  Scenario: Navigate to Settings Page
    Given I am on the User Profile Page
    When I tap on the Settings icon in the AppBar
    Then I should be navigated to the Settings Page
