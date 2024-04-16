import "package:flutter/services.dart";
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";

import "models/recipe_model.dart";
import "models/user.dart";

class DataBaseHelperFilters {
  static Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final finalPath = join(dbPath, "app.db");

    var database = await openDatabase(finalPath,
        version: 1, onCreate: create, singleInstance: true);

    return database;
  }

  static Future<void> create(Database database, int version) async {
    await database.execute("""
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
);""");
    await database.execute("""
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

""");
    await database.rawInsert(
        """INSERT INTO RECIPE (title, sustainability, cusineType, rating, permanentPost, preparation, author) VALUES
    ('MEXILHÕES com chouriço e açafrão',
     4,
     'Cozinha Mediterrânea',
     NULL,
     1,
     '1. Numa panela grande em lume médio, frite o chouriço com azeite, alho e polpa de tomate.
      2. Cozinhe, mexendo ocasionalmente, até que o chouriço esteja cozido, adicione o tomate picado fresco, açafrão, tomilho, alecrim e manjericão.
      3. Adicione os mexilhões e o vinho branco e deixe evaporar o vinho. Se necessário, adicione um pouco de caldo de peixe e deixe cozinhar até que todos os mexilhões estejam abertos.
      4. Descarte qualquer mexilhão que não abra e adicione a raspa de limão aos restantes.
      5. Sirva imediatamente com um pouco de pão.',
     1);
""");

    await database.rawInsert(
        """INSERT INTO RECIPE (title, sustainability, cusineType, rating, permanentPost, preparation, author) VALUES
    ('Blah blah blah',
     4,
     'Cozinha Mediterrânea',
     NULL,
     1,
     '1. Numa panela grande em lume médio, frite o chouriço com azeite, alho e polpa de tomate.
      2. Cozinhe, mexendo ocasionalmente, até que o chouriço esteja cozido, adicione o tomate picado fresco, açafrão, tomilho, alecrim e manjericão.
      3. Adicione os mexilhões e o vinho branco e deixe evaporar o vinho. Se necessário, adicione um pouco de caldo de peixe e deixe cozinhar até que todos os mexilhões estejam abertos.
      4. Descarte qualquer mexilhão que não abra e adicione a raspa de limão aos restantes.
      5. Sirva imediatamente com um pouco de pão.',
     1);
""");

    await database.rawInsert(
        """INSERT INTO RECIPE (title, sustainability, cusineType, rating, permanentPost, preparation, author) VALUES
    ('Bleh bleh bleh',
     4,
     'Cozinha Mediterrânea',
     NULL,
     1,
     '1. Numa panela grande em lume médio, frite o chouriço com azeite, alho e polpa de tomate.
      2. Cozinhe, mexendo ocasionalmente, até que o chouriço esteja cozido, adicione o tomate picado fresco, açafrão, tomilho, alecrim e manjericão.
      3. Adicione os mexilhões e o vinho branco e deixe evaporar o vinho. Se necessário, adicione um pouco de caldo de peixe e deixe cozinhar até que todos os mexilhões estejam abertos.
      4. Descarte qualquer mexilhão que não abra e adicione a raspa de limão aos restantes.
      5. Sirva imediatamente com um pouco de pão.',
     1);
""");

    await database
        .rawInsert("""INSERT INTO USER (name) VALUES ("Marine Choice");
""");
  }

  static Future<List<Recipe>?> getAllRecipes() async {
    try {
      final db = await initDB();

      (await db.query('sqlite_master', columns: ['type', 'name']))
          .forEach((row) {
        print(row.values);
      });

      final List<Map<String, dynamic>> maps = await db.rawQuery('''
        SELECT recipe.*, user.*
        FROM recipe
        JOIN user ON recipe.author = user.idUser
      ''');



      print(maps);

      if (maps.isEmpty) {
        return null;
      }

      return List.generate(
          maps.length, (index) {
            return Recipe.fromJson(maps[index]);

          });
    } catch (e) {
      print("Error: $e");
    }
  }
}
