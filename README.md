## MarineChoice Development Report 

Welcome to the documentation pages of the MarineChoice!

You can find here details about the MarineChoice, from a high-level vision to low-level implementation decisions, a kind of Software Development Report, organized by type of activities:

- [Business modeling](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/tree/master?tab=readme-ov-file#business-modelling)
    - [Product Vision](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/blob/master/README.md#product-vision)
    - [Features and Assumptions](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1?tab=readme-ov-file#features-and-assumptions)
    - [Elevator Pitch](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1?tab=readme-ov-file#elevator-pitch)
- [Requirements](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/blob/master/README.md#requirements)
    - [User stories](https://github.com/orgs/FEUP-LEIC-ES-2023-24/projects/46)
    - [Domain model](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1#domain-model)
- [Architecture and Design](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1?tab=readme-ov-file#architecture-and-design)
    - [Logical architecture](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1#logical-architecture)
    - [Physical architecture](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1#physical-architecture)
    - [Vertical prototype](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1#vertical-prototype)
- [Project Management](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1#project-management)
    - [Iteration retrospective meeting (V1.0.0)](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1?tab=readme-ov-file#iteration-retrospective-meeting-v100)
    - [Iteration retrospective meeting (V2.0.0)](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1?tab=readme-ov-file#iteration-retrospective-meeting-v200)
    - [Iteration retrospective meeting (V3.0.0)](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1?tab=readme-ov-file#iteration-retrospective-meeting-v300)


Contributions are expected to be made exclusively by the initial team, but we may open them to the community, after the course, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.

Please contact us!

Thank you!

Cláudia Mesquita ([up202206173@fe.up.pt](mailto:up202206173@fe.up.pt))
José Santos ([up202108673@fe.up.pt](mailto:up202108673@fe.up.pt))
Luana Lima ([up202206845@fe.up.pt](mailto:up202206845@fe.up.pt))
Pedro Costa ([up202206180@fe.up.pt](mailto:up202206180@fe.up.pt))
Pedro Lunet ([up202207150@fe.up.pt](mailto:up202207150@fe.up.pt))

## Business Modelling

### Product Vision

MarineChoice empowers seafood consumers by offering insights into harmful fishing practices, sustainable recipes, and fostering an eco-conscious community, all aimed at shaping a future where every seafood choice supports healthy oceans.

### Features and Assumptions

- Classify fish by sustainability: Organize fish species into categories indicating their sustainability status, allowing users to make informed choices about what seafood to consume.

- Login and Register: Provide a system for users to create accounts and log in, so they can use the application.

- Choose language for app: Allow users to select their preferred language between English and Portuguese, to enhance accessibility and usability.

- Give detailed information about species: Offer comprehensive details about each fish species, including habitat, nutrition, and cooking methods, aiding users in understanding their seafood choices.

- Give detailed information about why sustainability is important:  Educate users on the significance of sustainable fishing practices, emphasizing their impact on ecosystems and food security.

- Create an interactive map with several fishes' original fishing locations: Develop an interactive map showing the native fishing areas of various fish species, enhancing users' understanding of seafood origins.

- Give recipes that use sustainable fish: Provide a collection of recipes centered around sustainable seafood options, encouraging responsible consumption through delicious meal ideas.

- Create a post wall where users can share recipes: Establish a platform for users to share their favorite seafood recipes and cooking tips, fostering community engagement and knowledge exchange.

- Rate recipes: Enable users to rate and review recipes, facilitating recipe discovery and feedback sharing within the community.

- Search for specific type of cuisine: Implement a search feature allowing users to find recipes based on cuisine type, catering to diverse culinary preferences. 

- Filter Ingredients:  Incorporate filters for users to search recipes based on specific ingredients or dietary restrictions, enhancing customization and convenience in recipe discovery.

### Elevator Pitch

Sabiam que Portugal é o terceiro país no mundo que mais peixe consome por pessoa, segundo a União Europeia? O problema disto é o facto de nós consumirmos muito peixe não sustentável, como por exemplo, o famoso bacalhau. Por esta razão, nós decidimos criar esta app. Com a MarineChoice, eliminamos a incerteza da escolha de peixe sustentável, capacitando os consumidores conscientes a tomar decisões informadas. A nossa aplicação categoriza as espécies de peixes de acordo com o seu estado de sustentabilidade, oferece 
informações sobre práticas de pesca prejudiciais e disponibiliza receitas sustentáveis. Além disso, educamos os utilizadores sobre a importância da pesca sustentável e mapeamos os locais originais de pesca de várias espécies. Ao contrário de outras plataformas, promovemos uma comunidade de pessoas com mentalidade semelhante, apaixonadas por preservar os nossos oceanos. Juntem-se à MarineChoice: a fazer ondas por um futuro de pesca sustentável!

## Requirements

### Domain Model

![domain modeling](/images/domain_model.png)

## Architecture and Design

### Logical Design

![logical design](/images/logical_design.png)

### Physical Architecture

![physical architecture](/images/physical_architecture.png)

### Vertical Prototype

In this prototype we have implemented a few simple features, like allowing the user to press read more to expand information, the user being able to scroll, and a search bar, like we can see on the images below.

![1](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/assets/93152747/ee0e0b97-f562-42a7-be5a-5778b6db6f97)
![2](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/assets/93152747/fa068ac2-a1f5-430b-bf25-7dfb4c91a69d)
![3](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/assets/93152747/43f33edf-836e-4f2b-985b-243b7a0026ae)
![4](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/assets/93152747/b52f1805-0d65-4584-a714-67c1f31f7ec4)

## Project Management

# Iteration retrospective meeting (V1.0.0)
[#19](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/issues/19) - Interactive map feature allowing users to view protected areas to monitor overfishing.<br>
[#16](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/issues/16) - Interactive map showcasing various fishes' original fishing locations.<br>
[#17](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/issues/17) - Recipe list feature displaying sustainable fish recipes for user convenience.<br>
[#18](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/issues/18) - Detailed recipe information view to provide users with cooking instructions.<br>


## What went well?
- We have successfully implemented all planned features and resolved identified issues in accordance with the outlined objectives.
- We worked well together as a team, supporting each other's strengths and weaknesses, which helped us achieve our goals effectively.

## What could have gone better?
- We should have organized our priorities better to manage our resources more efficiently.
- We should have started working earlier to get things done more smoothly.
- We should have implemented better organization within the codebase.

## What still puzzles us?
- Despite our efforts, we encountered ongoing challenges with the architectures.
- We encountered difficulties with the acceptance tests.
- We were not able to complete unit testing.

## What are we going to do to improve?
- We should always start a meeting by determining what we can do until our next meeting and who should do what.
- We should schedule a metting for every saturday afternoon, so we can set up everything early in the sprint.
- We should try to follow good coding practices, get rid of dead code and try to minimize repeated code.

# Iteration retrospective meeting (V2.0.0)
[#7](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/issues/7)  - Information about marine sustainability in home page. <br>
[#8](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/issues/8)  - Login  and register fully working. <br>
[#6](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/issues/6)  - Filters for ingredients in recipes.<br>
[#5](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/issues/5)  - Filters for types of cuisine in recipes.<br>

## What went well?
- We have successfully implemented all planned features and resolved identified issues in accordance with the outlined objectives.
- We worked well together as a team, supporting each other's strengths and weaknesses, which helped us achieve our goals effectively.
- We were able to better manage our time.

## What could have gone better?
- We struggled to balance the workload in this class with our remaining workload.
- We weren't able to do one of our weekly meetings due to external issues.

## What still puzzles us?
- We were not able to complete unit testing.
- We haven't figured out the full potential of the Realtime Database.

## What are we going to do to improve?
- We should strive to learn more about the resources we are using (firebase, flutter).
- We should start working earlier, to achieve this we should push each other to work by working during meetings.
- We should make sure to read all the delivery rules many times throught the sprint, so we don't miss information.

# Iteration retrospective meeting (V3.0.0)
[#4](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/issues/4)  - Edit recipes. <br>
[#9](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/issues/9)  - List of susbtainable fish. <br>
[#10](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/issues/10)  - Post recipes. <br>
[#11](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/issues/11)  - Rate recipes and show the average rating for each recipe. <br>
[#12](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/issues/12)  - See detailed information about species. <br>
[#13](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/issues/13)  - Read other users recipes. <br>
[#14](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/issues/14)  - Swap the language between portuguese and english. <br>
[#15](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/issues/15)  - Show the average rating for each recipe. <br>

## What went well?
- We have successfully implemented all planned features and resolved identified issues in accordance with the outlined objectives.
- We worked well together as a team, supporting each other's strengths and weaknesses, which helped us achieve our goals effectively.
- We were able to better manage our time, even better than most other sprint.
- We had better communication overall.

## What could have gone better?
- We might have forgotten to double check some features.

## What still puzzles us?
- We were not able to complete unit testing.

# Board

Sprint 1 beginning:

![image](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/assets/93152747/3efa67e3-0c0c-4170-b65a-194aab3da556)

Sprint 1 end:

![image](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/assets/93152747/84a559a9-8d74-4208-a5bc-bce7a13fc765)

[Release V1.0.0](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/releases/tag/Releasev1.0.0)

# Board

Sprint 2 beginning:

![image](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/assets/93152747/c97631af-9bd7-402a-8fc8-70514808585f)

Sprint 2 end:

![image](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/assets/93152747/3c0fe27e-e9e6-4b3c-8d6a-f7148cb93174)

[Release V2.0.0](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/releases/tag/ReleaseV2.0.0)

# Board

Sprint 3 beginning:

![image](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/assets/93152747/a1bdc559-e892-412d-a4ee-dc95287d548e)

Sprint 3 end:

![image](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/assets/93152747/d3363751-ff6b-4ef6-9f5e-66dabfce1ec8)

[Release V3.0.0](https://github.com/FEUP-LEIC-ES-2023-24/2LEIC14T1/releases/tag/ReleaseV3.0.0)
# Sprint Reviews

- Sprint 1
In this sprint, we encountered a few mishaps. Notably, there were some errors, such as items not being properly assigned to the respective team members, and the release being incorrectly marked. Despite these challenges, we successfully completed all the tasks we had planned for this sprint and addressed some issues that had persisted from Sprint 0.

- Sprint 2
In this sprint, we successfully addressed the issues described previously and began drafting the changelog. We have completed the all of the user stories planned for this sprint.

- Sprint 3
In this sprint, we successfully finished all the features we set out to do. And worked efficiently and cooperatively.


