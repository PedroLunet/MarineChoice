DROP TABLE IF EXISTS USER;
CREATE TABLE USER
(
    idUser integer PRIMARY KEY AUTOINCREMENT,
    name varchar(100),
    username varchar(20),
    password varchar(30),
    language boolean,
    UNIQUE (username),
    UNIQUE (password)
);


DROP TABLE IF EXISTS RECIPE;
CREATE TABLE RECIPE
(
    idRecipe integer PRIMARY KEY AUTOINCREMENT,
    title varchar(50),
    sustainability float CHECK (sustainability >= 0 AND sustainability <= 5),
    cusineType varchar(50),
    rating float,
    permanentPost boolean,
    preparation varchar(5000),
    author integer,
    FOREIGN KEY (author) REFERENCES USER(idUser)
        ON UPDATE CASCADE
);


DROP TABLE IF EXISTS FISH;
CREATE TABLE FISH
(
    idFish integer PRIMARY KEY AUTOINCREMENT,
    name varchar(50),
    origin varchar(100),
    sustainabilityRate double,
    avgPricePerKg double
);


DROP TABLE IF EXISTS PROTAREA;
CREATE TABLE PROTAREA
(
    idAreaP integer,
    latitude float,
    longitude float,
    description varchar(100),
    PRIMARY KEY (idAreaP)
);


DROP TABLE IF EXISTS FISHAREA;
CREATE TABLE FISHAREA
(
    idAreaF integer,
    latitude double,
    longitude double,
    fish integer,
    FOREIGN KEY (fish) REFERENCES FISH(idFish),
    PRIMARY KEY (idAreaF)
);


DROP TABLE IF EXISTS INGREDIENT;
CREATE TABLE INGREDIENT
(
    idIngredient integer PRIMARY KEY AUTOINCREMENT,
    ingredient varchar(100)
);


DROP TABLE IF EXISTS RECIPEING;
CREATE TABLE RECIPEING
(
    id integer PRIMARY KEY AUTOINCREMENT,
    idRecipe integer,
    idIngredient integer,
    idFish integer,
    units varchar(20),
    quantity float,
    more varchar(50),
    CHECK ((idIngredient == NULL AND idFish != NULL) OR (idIngredient != NULL AND idFish == NULL)),
    FOREIGN KEY (idRecipe) REFERENCES RECIPE(idRecipe),
    FOREIGN KEY (idIngredient) REFERENCES INGREDIENT(idIngredient),
    FOREIGN KEY (idFish) REFERENCES FISH(idFish),
    UNIQUE (idRecipe, idIngredient, idFish)
);

INSERT INTO USER (name) VALUES ("Marine Choice");

INSERT INTO RECIPE (title, sustainability, cusineType, rating, permanentPost, preparation, author) VALUES
    ("MEXILHÕES com chouriço e açafrão",
     4,
     "Cozinha Mediterrânea",
     NULL,
     1,
     "1. Numa panela grande em lume médio, frite o chouriço com azeite, alho e polpa de tomate.
      2. Cozinhe, mexendo ocasionalmente, até que o chouriço esteja cozido, adicione o tomate picado fresco, açafrão, tomilho, alecrim e manjericão.
      3. Adicione os mexilhões e o vinho branco e deixe evaporar o vinho. Se necessário, adicione um pouco de caldo de peixe e deixe cozinhar até que todos os mexilhões estejam abertos.
      4. Descarte qualquer mexilhão que não abra e adicione a raspa de limão aos restantes.
      5. Sirva imediatamente com um pouco de pão.",
     1);



INSERT INTO RECIPEING (idRecipe, idIgredient, idFish, units, quantity, more) VALUES (1, 158, NULL, "g", 100, NULL);
INSERT INTO RECIPEING (idRecipe, idIgredient, idFish, units, quantity, more) VALUES (1, 86, NULL, "pitada", 1, "picado");
INSERT INTO RECIPEING (idRecipe, idIgredient, idFish, units, quantity, more) VALUES (1, 49, NULL, "colher de sopa", 1);
INSERT INTO RECIPEING (idRecipe, idIgredient, idFish, units, quantity, more) VALUES (1, 33, NULL, "dente", 2, NULL);
INSERT INTO RECIPEING (idRecipe, idIgredient, idFish, units, quantity, more) VALUES (1, 79, NULL, "colher de sopa", 1, NULL);
--INSERT INTO RECIPEING (idRecipe, idIgredient, idFish, units, quantity, more) VALUES (1, 79, NULL, "colher de sopa", 1, NULL);



--Fruta
INSERT INTO INGREDIENT (Ingredient) VALUES ("Maçã");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Banana");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Laranja");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Morango");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Ananás");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Melancia");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Melão");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Meloa");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Uva");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Pera");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Manga");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Kiwi");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Limão");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Lima");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Pêssego");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Abacate");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Cereja");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Papaia");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Coco");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Maracujá");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Tangerina");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Mirtilo");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Romã");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Framboesa");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Amora");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Groselha");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Goiaba");
--Hortículas
INSERT INTO INGREDIENT (Ingredient) VALUES ("Alface");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Espinafre");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Couve");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Rúcula");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Agrião");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Alho");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Bróculos");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Couve-flor");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Repolho");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Beterraba");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Cenoura");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Rabanete");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Nabo");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Salsa");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Cebolinho");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Alho-francês");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Coentro");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Manjericão");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Pimentão");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Pimento");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Tomate");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Tomate Fresco");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Pepino");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Abóbora");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Cabaça");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Berinjela");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Milho");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Batata");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Batata-doce");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Mandioca");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Chuchu");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Cogumelo");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Aipo");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Espargo");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Alcachofra");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Beterraba");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Cebola");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Cebola-roxa");
--Temperos
INSERT INTO INGREDIENT (Ingredient) VALUES ("Pimenta Branca");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Pimenta-do-reino");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Pimenta");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Sal");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Oregão");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Paprica");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Cúrcuma");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Gengibre");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Canela");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Noz-moscada");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Cominho");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Coentro");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Alecrim");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Tomilho");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Manjericão");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Louro");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Alho em pó");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Cidreira");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Pimentão-doce");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Malagueta");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Açafrão");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Colorau");
--Molhos
INSERT INTO INGREDIENT (Ingredient) VALUES ("Ketchup");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Maionese");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Mostarda");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Molho de Soja");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Polpa de Tomate");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Molho de Tomate");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Molho César");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Molho de Iogurte");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Pesto");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Azeite");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Óleo");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Óleo de Coco");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Manteiga");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Mararina");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Banha de Porco");
--Cereais, Derivados e Tubércules
INSERT INTO INGREDIENT (Ingredient) VALUES ("Arroz");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Trigo");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Milho");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Aveia");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Centeio");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Quinoa");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Farinha de Trigo");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Farinha de Milho");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Flocos de Aveia");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Cuscuz");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Esparguete");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Massa");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Pão");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Bolacha");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Granola");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Cereais");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Tapioca");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Pão de Forma");
--Laticíneos
INSERT INTO INGREDIENT (Ingredient) VALUES ("Leite");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Queijo");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Iogurte");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Creme de Leite");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Requeijão");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Queijo Creme");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Leite Condensado");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Leite em Pó");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Queijo Cottage");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Queijo Mascarpone");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Queijo Parmesão");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Queijo Cheddar");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Queijo Gorgonzola");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Queijo Brie");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Queijo Camembert");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Queijo Feta");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Queijo Rico");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Queijo Ralado");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Queijo Fresco");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Nata");
--Leguminosas
INSERT INTO INGREDIENT (Ingredient) VALUES ("Feijão-verde");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Feião Manteiga");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Feijão Vermelho");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Feijão Preto");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Feijão Frade");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Feijão Branco");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Lentilha");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Grão-de-bico");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Fava");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Tremoço");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Ervilha");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Pinhão");
--Carne
INSERT INTO INGREDIENT (Ingredient) VALUES ("Ovo");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Bife de Porco");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Bife de Vaca");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Bifana");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Alheira");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Chouriço");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Linguiça");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Presunto");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Farinheira");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Morcela");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Picanha");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Borrego");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Entrecosto");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Coelho");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Leitão");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Pato");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Frango");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Salsicha Fresca");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Prego");
--Outros
INSERT INTO INGREDIENT (Ingredient) VALUES ("Açúcar");
INSERT INTO INGREDIENT (Ingredient) VALUES ("Água");