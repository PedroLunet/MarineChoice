## MarineChoice

### PRODUCT VISION

MarineChoice is a phone application that allows users to make conscientious choices about the types of fish they consume on a daily basis by providing them with the information and resources to learn about the harm in non-sustainable fishing and the overconsumption of fish in general. Along with this information, our app also allows the user to learn more about marine life, gives them a surplus of recipes that use susbtainable fish, and share their own.

This project was developed by Cláudia Mesquita ([up202206173@fe.up.pt](mailto:up202206173@fe.up.pt)), Pedro Costa ([up202206180@fe.up.pt](mailto:up202206180@fe.up.pt)), Luana Lima ([up202206845@fe.up.pt](mailto:up202206845@fe.up.pt)), José Santos ([up202108673@fe.up.pt](mailto:up202108673@fe.up.pt)), Pedro Lunet ([up202207150@fe.up.pt](mailto:up202207150@fe.up.pt)), Team 1 - Class 14, for 'Engenharia de Software' 2023/24.

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

- As a user, I want to be able to edit my recipes, so that I can correct mistakes.

### ACCEPTANCE TESTS

**Feature:** Consult the list of sustainable fish

&nbsp;&nbsp;**Scenario:** User consults the list of sustainable fish

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Given** the user is on the homepage

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**When** the user navigates to the "Sustainable Fish" page

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Then** the user should see a list of sustainable fish

&nbsp;

**Feature:** View detailed information about species

&nbsp;&nbsp;**Scenario:** User views detailed information about a fish species

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Given** the user is on the "Sustainable Fish" page

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**When** the user clicks on a fish species

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Then** the user should see detailed information about that species

&nbsp;

**Feature:** View information about marine sustainability

&nbsp;&nbsp;**Scenario:** User views information about marine sustainability

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Given** the user is on the homepage

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Then** the user should see information about marine sustainability

&nbsp;

**Feature:** Access interactive map with fishing locations

&nbsp;&nbsp;**Scenario:** User accesses interactive map with fishing locations

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Given** the user is on the homepage

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**When** the user navigates to the "Interactive Map" page

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Then** the user should see an interactive map with fishing locations

&nbsp;

**Feature:** Access interactive map with protected areas

&nbsp;&nbsp;**Scenario:** User accesses interactive map with protected areas

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Given** the user is on the "Interactive Map" page

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**When** the user clicks on the "Protected Areas" filter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Then** the user should see protected areas highlighted on the map

&nbsp;

**Feature:** Consult a list of recipes that use sustainable fish

&nbsp;&nbsp;**Scenario:** User consults a list of recipes that use sustainable fish

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Given** the user is on the homepage

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**When** the user navigates to the "Recipes" page

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Then** the user should see a list of recipes that use sustainable fish

&nbsp;

**Feature:** View detailed information of recipes

&nbsp;&nbsp;**Scenario:** User views detailed information of a recipe

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Given** the user is on the "Recipes" page

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**When** the user clicks on a recipe

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Then** the user should see detailed information of that recipe

&nbsp;

**Feature:** Post recipes

&nbsp;&nbsp;**Scenario:** User posts a recipe

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Given** the user is logged in

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**When** the user navigates to the "Post Recipe" page

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**And** the user fills in the recipe form and submits it

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Then** the user's recipe should be added to the "Recipes" page

&nbsp;

**Feature:** Read other users' recipes

&nbsp;&nbsp;**Scenario:** User reads other users' recipes

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Given** the user is on the "Recipes" page

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**When** the user clicks on a recipe posted by another user

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Then** the user should see detailed information of that recipe

&nbsp;

**Feature:** Rate recipes

&nbsp;&nbsp;**Scenario:** User rates a recipe

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Given** the user is logged in and viewing a recipe

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**When** the user clicks on a star to rate the recipe

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Then** the user's rating should be saved and displayed

&nbsp;

**Feature:** View ratings

&nbsp;&nbsp;**Scenario:** User views ratings of a recipe

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Given** the user is on the "Recipes" page

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**When** the user clicks on a recipe

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Then** the user should see the ratings of that recipe

&nbsp;

**Feature:** Search for a specific type of cuisine

&nbsp;&nbsp;**Scenario:** User searches for a specific type of cuisine

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Given** the user is on the "Recipes" page

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**When** the user enters a cuisine type in the search bar and submits it

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Then** the user should see a list of recipes that match the cuisine type

&nbsp;

**Feature:** Register

&nbsp;&nbsp;**Scenario:** Guest registers

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Given** the guest is on the login page

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**When** the guest clicks on the "Register" button

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Then** the guest should be redirected to the "Register" page

&nbsp;

**Feature:** Login 

&nbsp;&nbsp;**Scenario:** Guest logs in

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Given** the guest is on the login page

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**When** the guest fills their information and clicks the "Login" button

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Then** the guest should be redirected to the homepage

&nbsp;

**Feature:** Swap between Portuguese and English

&nbsp;&nbsp;**Scenario:** User swaps between Portuguese and English

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Given** the user is on any page

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**When** the user clicks on the language toggle button

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Then** the page should be displayed in the selected language

&nbsp;

**Feature:** Filter ingredients

&nbsp;&nbsp;**Scenario:** User filters ingredients

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Given** the user is on the "Recipes" page

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**When** the user enters an ingredient in the filter bar and submits it

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Then** the user should see a list of recipes that match the filtered ingredient

&nbsp;

**Feature:** Edit recipe

&nbsp;&nbsp;**Scenario:** User edits recipe they created

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Given** the user is in recipe page

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**When** the user clicks to edit their own recipe

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Then** the user should be able to edit the recipe  
