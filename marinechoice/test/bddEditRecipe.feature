Feature: Edit Recipe Page

  Scenario: User views the Edit Recipe page
    Given the user is on the Edit Recipe page
    Then the user should see the recipe title
    And the user should see the cuisine type options
    And the user should see the ingredients list
    And the user should see the fishes list
    And the user should see the recipe steps
    And the user should see the option to add a step
    And the user should see the option to pick an image

  Scenario: User adds a recipe step
    Given the user is on the Edit Recipe page
    When the user taps on the "Add Step" button
    Then a new recipe step should be added

  Scenario: User selects an image
    Given the user is on the Edit Recipe page
    When the user taps on the "Pick Image" button
    Then the user should be able to select an image from the gallery
    And the selected image should be displayed

  Scenario: User edits the recipe and saves
    Given the user is on the Edit Recipe page
    When the user fills in the title, cuisine type, ingredients, fishes, and steps
    And the user taps on the "Edit Recipe" button
    Then the recipe should be updated in the database
    And the user should be navigated to the Recipe Information page

  Scenario: User navigates using bottom navigation bar
    Given the user is on any page
    When a bottom navigation bar item is tapped
    Then the corresponding page should be navigated to

  Scenario: User navigates to Settings page from app bar
    Given the user is on any page
    When the settings icon in the app bar is tapped
    Then the Settings page should be navigated to
