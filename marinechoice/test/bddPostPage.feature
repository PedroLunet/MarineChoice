Feature: Post Recipe Functionality
  As a user,
  I want to post recipes with details like title, cuisine type, ingredients, fishes, and steps
  So that I can share my recipes with others

  Background:
    Given I am on the Home Page

  Scenario: Post Recipe
    Given I navigate to the Post Page
    Then I should see the page background color as "#B4D8F9"
    And I should see the AppBar with title "MarineChoice"
    And I should see input fields for title, cuisine type, ingredients, fishes, and recipe steps
    And I should see a button to pick an image
    When I fill in all the required information
    And I upload an image
    Then I should see a success message that the recipe is posted
    And I should be navigated to the User Profile Page

  Scenario: Navigate through Bottom Navigation Bar
    Given I am on the Post Page
    When I tap on the Home icon in the Bottom Navigation Bar
    Then I should be navigated to the Home Page
    When I tap on the Fish icon in the Bottom Navigation Bar
    Then I should be navigated to the Fish Page
    When I tap on the Cook icon in the Bottom Navigation Bar
    Then I should be navigated to the Recipes Page
    When I tap on the Map icon in the Bottom Navigation Bar
    Then I should be navigated to the Map Page
    When I tap on the Post icon in the Bottom Navigation Bar
    Then I should stay on the Post Page
    When I tap on the User icon in the Bottom Navigation Bar
    Then I should be navigated to the User Profile Page

  Scenario: Navigate to Settings Page
    Given I am on the Post Page
    When I tap on the Settings icon in the AppBar
    Then I should be navigated to the Settings Page
