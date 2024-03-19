## MarineChoice

### PRODUCT VISION

MarineChoice is a phone application that allows users to make conscientious choices about the types of fish they consume on a daily basis by providing them with the information and resources to learn about the harm in non-sustainable fishing and the overconsumption of fish in general. Along with this information, our app also allows the user to learn more about marine life, gives them a surplus of recipes that use susbtainable fish, and share their own.

This project was developed by Cláudia Mesquita (up202206173@fe.up.pt), Pedro Costa (up202206180@fe.up.pt), Luana Lima (up202206845@fe.up.pt), José Santos (up202108673@fe.up.pt), Pedro Lunet (up202207150@fe.up.pt), Team 1 - Class 14, for 'Engenharia de Software' 2023/24.

### IMPLEMENTED FEATURES

(...)

### PLANNED FEATURES

- (Main Feature) Classify fish by sustainability;

- Login and Register;

- Choose language for app;

- Give detailed information about species;

- Give detailed information about why sustainability is important;

- Create an interactive map with several fishes' original fishing locations;

- Give recipes that use sustainable fish;

- Create a post wall where users can share recipes;

- Rate recipes;

- Search for specific type of cuisine;

- Filter Ingredients.

### DEPENDENCIES AND APIs

- Map

- Notifications

- Account recovery

### USER STORIES

- As a user, I want to consult the list of susbtainable fish, so that I can make educated choices about the type of fish I buy.

- As a user, I want to see detailed information about species, so that I can discover interesting facts about different types of fish.

- As a user, I want to see information about marine sustainability, so that I can evaluate my own ecological footprint and improve my habits.

- As a user, I want to have access to an interactive map with several fishes' original fishing locations, so that I can be aware of the location of the fish I'm going to buy.

- As a user, I want to have access the interactive map to show me protected areas, so that I can be aware when there is overfishing in a protected area.

- As a user, I want to consult a list of recipes that use sustainable fish, so that it is easier for me to choose to consume it and I can more easily insert it into my diet.

- As a user I want to see detailed information of recipes, so that I can know how to make them.

- As a user, I want to be able to post my recipes, so that I can help grow the repertoire of recipes.

- As a user, I want to be able to read other users recipes, so that I can have access to a lot more recipes.

- As a user, I want to be able to rate recipes via stars, so that I let other users know the quality of the recipe.

- As a user, I want to be able to view ratings, so that it's easier to choose a recipe.

- As a user, I want to be able to search for a specific type of cuisine, so that it's easier for me to choose a meal.

- As a guest, I want to be able to log in or register, so that I can access the app using my account.

- As a user, I want to be able to swap between portuguese and english, so that I can choose the one that I'm most confortable with.

- As a user, I want to be able to filter ingredients, so that I can add/remove ingredients that I do/don't want.

### ACCEPTANCE TESTS

Feature: Consult the list of sustainable fish
  Scenario: User consults the list of sustainable fish
    Given the user is on the homepage
    When the user navigates to the "Sustainable Fish" page
    Then the user should see a list of sustainable fish

Feature: View detailed information about species
  Scenario: User views detailed information about a fish species
    Given the user is on the "Sustainable Fish" page
    When the user clicks on a fish species
    Then the user should see detailed information about that species

Feature: View information about marine sustainability
  Scenario: User views information about marine sustainability
    Given the user is on the homepage
    When the user navigates to the "Marine Sustainability" page
    Then the user should see information about marine sustainability

Feature: Access interactive map with fishing locations
  Scenario: User accesses interactive map with fishing locations
    Given the user is on the homepage
    When the user navigates to the "Interactive Map" page
    Then the user should see an interactive map with fishing locations

Feature: Access interactive map with protected areas
  Scenario: User accesses interactive map with protected areas
    Given the user is on the "Interactive Map" page
    When the user clicks on the "Protected Areas" filter
    Then the user should see protected areas highlighted on the map

Feature: Consult a list of recipes that use sustainable fish
  Scenario: User consults a list of recipes that use sustainable fish
    Given the user is on the homepage
    When the user navigates to the "Recipes" page
    Then the user should see a list of recipes that use sustainable fish

Feature: View detailed information of recipes
  Scenario: User views detailed information of a recipe
    Given the user is on the "Recipes" page
    When the user clicks on a recipe
    Then the user should see detailed information of that recipe

Feature: Post recipes
  Scenario: User posts a recipe
    Given the user is logged in
    When the user navigates to the "Post Recipe" page
    And the user fills in the recipe form and submits it
    Then the user's recipe should be added to the "Recipes" page

Feature: Read other users' recipes
  Scenario: User reads other users' recipes
    Given the user is on the "Recipes" page
    When the user clicks on a recipe posted by another user
    Then the user should see detailed information of that recipe

Feature: Rate recipes
  Scenario: User rates a recipe
    Given the user is logged in and viewing a recipe
    When the user clicks on a star to rate the recipe
    Then the user's rating should be saved and displayed

Feature: View ratings
  Scenario: User views ratings of a recipe
    Given the user is on the "Recipes" page
    When the user clicks on a recipe
    Then the user should see the ratings of that recipe

Feature: Search for a specific type of cuisine
  Scenario: User searches for a specific type of cuisine
    Given the user is on the "Recipes" page
    When the user enters a cuisine type in the search bar and submits it
    Then the user should see a list of recipes that match the cuisine type

Feature: Log in or register
  Scenario: Guest logs in or registers
    Given the guest is on the homepage
    When the guest clicks on the "Log In" or "Register" button
    Then the guest should be redirected to the "Log In" or "Register" page

Feature: Swap between Portuguese and English
  Scenario: User swaps between Portuguese and English
    Given the user is on any page
    When the user clicks on the language toggle button
    Then the page should be displayed in the selected language

Feature: Filter ingredients
  Scenario: User filters ingredients
    Given the user is on the "Recipes" page
    When the user enters an ingredient in the filter bar and submits it
    Then the user should see a list of recipes that match the filtered ingredient