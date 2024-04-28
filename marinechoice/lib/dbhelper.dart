import "package:sqflite/sqflite.dart";
import "package:path/path.dart";

import "models/randof.dart";
import "models/randop.dart";
import "models/rando.dart";

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

    await database.execute("""
CREATE TABLE FISH
(
    idFish integer PRIMARY KEY AUTOINCREMENT,
    name varchar(50),
    origin varchar(100),
    sustainabilityRate float,
    avgPricePerKg float
);


""");

    await database.execute("""
CREATE TABLE PROTAREA
(
    idAreaP integer,
    latitude float,
    longitude float,
    description varchar(100),
    PRIMARY KEY (idAreaP)
);

""");

    await database.execute("""
CREATE TABLE FISHAREA
(
    idAreaF integer,
    latitude float,
    longitude float,
    fish integer,
    FOREIGN KEY (fish) REFERENCES FISH(idFish),
    PRIMARY KEY (idAreaF)
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
    ("SARDINHAS enroladas em folhas de videira",
     4,
     "Cozinha Mediterrânea",
     NULL,
     1,
     "1. Mergulhe as folhas de videira em água salgada a ferver durante 3 a 4 minutos.
      2. Lave rapidamente com água corrente fria de modo a que as folhas mantenham a sua cor verde. 
      3. Espalhe as folhas de videira numa toalha absorvente para secar. 
      4. Limpe as sardinhas, retirando a cabeça e as vísceras. 
      5. Tempere com uma pitada de sal kosher e coloque o peixe numa peneira por 10 minutos para drenar.
      6. Enrole as sardinhas nas folhas de videira (cada sardinha numa folha). Se as folhas de videira forem demasiado grandes, corte-as ao meio.
      7. Coloque as folhas de videira recheadas numa assadeira e regue com azeite. 
      8. Pré-aqueça o forno a 180° durante 10 a 15 minutos e inicie a cozedura.
      9. Acompanhe o prato com salada e vinho grego Santorini DOP.",
     1);

""");

    await database.rawInsert(
        """INSERT INTO RECIPE (title, sustainability, cusineType, rating, permanentPost, preparation, author) VALUES
    ("PESCADA alla chitarra",
     3.5,
     "Cozinha Mediterrânea",
     NULL,
     1,
     "1. Num liquidificador, misture o pão com 2 colheres de sopa de azeite, um punhado de salsa, manjericão e uma pitada de sal.
      2. Triture tudo e, em seguida, torre numa frigideira e reserve. 
      3. Corte finamente a parte verde do alho-francês e leve a alourar na frigideira com 2 colheres de sopa de azeite.
      4. Pique os filetes de pescada em cubos de tamanho médio, e misture-os com o alho-francês, acrescentando sal e piri-piri.
      5. Adicione o vinho e deixe ferver até reduzir.
      6. Rale e esprema o limão, junte a raspa e o sumo ao peixe e retire do lume.
      7. Coza a massa numa panela grande com água a ferver.
      8. Quando cozida, adicione-a ao molho de peixe que acabou de preparar.
      9. Frite por dois minutos e divida pelos pratos. Junte pão ralado e manjericão por cima e deleite-se!",
     1);
""");

    await database.rawInsert(
        """INSERT INTO RECIPE (title, sustainability, cusineType, rating, permanentPost, preparation, author) VALUES
     ("BACALHAU CONFITADO com tomate seco e alperces",
     4,
     "Cozinha Portuguesa",
     NULL,
     1,
     "1. Disponha o bacalhau numa assadeira, perfume com azeite extra virgem e guarneça com o tomate seco, o alperce, o alho, a pimenta verde, sal e alecrim. 
      2. Cubra e leve ao forno pré-aquecido até que o peixe esteja pronto. 
      3. Enquanto isso prepare o puré de batata. Numa panela grande, aqueça o azeite com alho, cebola e alho-francês, adicione as batatas e deixe cozinhar um pouco.
      4. Junte o caldo de galinha e o leite e cozinhe em lume baixo.
      5. Tempere com sal e pimenta e triture tudo junto até ficar liso e macio.
      6. Corte o espinafre em tiras finas e adicione ao puré.
      7. Sirva o bacalhau em cima de uma porção de puré de batata, regue com o molho restante e delicie-se!",
     1);
""");

    await database
        .rawInsert("""INSERT INTO USER (name) VALUES ("Marine Choice");
""");

    await database
        .rawInsert("""INSERT INTO FISH (Name) VALUES ("Bacalhau");""");
    await database
        .rawInsert("""INSERT INTO FISH (Name) VALUES ("Sardinha");""");
    await database
        .rawInsert("""INSERT INTO FISH (Name) VALUES ("Mexilhão");""");
    await database.rawInsert("""INSERT INTO FISH (Name) VALUES ("Salmão");""");
    await database.rawInsert("""INSERT INTO FISH (Name) VALUES ("Camarão");""");
    await database.rawInsert("""INSERT INTO FISH (Name) VALUES ("Pescada");""");

    await database.rawInsert(
        """INSERT INTO FISHAREA (latitude, longitude, fish) VALUES (67.3333, 7.5, 1);""");
    await database.rawInsert(
        """INSERT INTO FISHAREA (latitude, longitude, fish) VALUES (37.1167, -8.5333, 2);""");
    await database.rawInsert(
        """INSERT INTO FISHAREA (latitude, longitude, fish) VALUES (48.6333, -1.5, 3);""");
    await database.rawInsert(
        """INSERT INTO FISHAREA (latitude, longitude, fish) VALUES (46.0, -124.0, 4);""");
    await database.rawInsert(
        """INSERT INTO FISHAREA (latitude, longitude, fish) VALUES (-27.1667, 153.25, 5);""");
    await database.rawInsert('''
  INSERT INTO FISHAREA (latitude, longitude, fish)
  VALUES (41.6667, -70.25, 6);
''');

    await database.rawInsert(
        """INSERT INTO PROTAREA (latitude, longitude, description) VALUES (23.3985, -109.4222, "Parque Nacional Marinho de Cabo Pulmo (México)");""");
    await database.rawInsert(
        """INSERT INTO PROTAREA (latitude, longitude, description) VALUES (-18.2861, 147.6992, "Great Barrier Reef Marine Park (Austrália)");""");
    await database.rawInsert(
        """INSERT INTO PROTAREA (latitude, longitude, description) VALUES (8.6755, 119.8873, "Parque Nacional Marinho de Tubbataha Reefs (Filipinas)");""");
    await database.rawInsert(
        """INSERT INTO PROTAREA (latitude, longitude, description) VALUES (-3.8576, -32.4305, "Parque Nacional Marinho Fernando de Noronha (Brasil)");""");
    await database.rawInsert(
        """INSERT INTO PROTAREA (latitude, longitude, description) VALUES (-8.5272, 119.4952, "Parque Nacional Marinho de Komodo (Indonésia)");""");
    await database.rawInsert(
        """INSERT INTO PROTAREA (latitude, longitude, description) VALUES (-0.8329, -91.1349, "Parque Nacional Marinho das Ilhas Galápagos (Equador)");""");
    await database.rawInsert(
        """INSERT INTO PROTAREA (latitude, longitude, description) VALUES (25.7789, -170.7247, "Santuário Marinho de Papahānaumokuākea (Havaí, EUA)");""");
    await database.rawInsert(
        """INSERT INTO PROTAREA (latitude, longitude, description) VALUES (25.4695, -80.1319, "Parque Nacional Marinho de Biscayne (Flórida, EUA)");""");
    await database.rawInsert(
        """INSERT INTO PROTAREA (latitude, longitude, description) VALUES (2.7984, 104.1689, "Parque Nacional Marinho de Tioman (Malásia)");""");
    await database.rawInsert(
        """INSERT INTO PROTAREA (latitude, longitude, description) VALUES (17.1713, -87.7561, "Parque Nacional Marinho dos Corais de Belize (Belize)");""");
    await database.rawInsert(
        """INSERT INTO PROTAREA (latitude, longitude, description) VALUES (43.0007, 6.4044, "Parque Nacional Marinho de Port-Cros (França)");""");
    await database.rawInsert(
        """INSERT INTO PROTAREA (latitude, longitude, description) VALUES (37.0171, -8.9389, "Parque Nacional Marinho de Sagres (Portugal)");""");
    await database.rawInsert(
        """INSERT INTO PROTAREA (latitude, longitude, description) VALUES (41.3736, 9.3048, "Parque Nacional Marinho de Lavezzi (França)");""");
    await database.rawInsert(
        """INSERT INTO PROTAREA (latitude, longitude, description) VALUES (42.2247, -8.9076, "Parque Nacional Marinho das Ilhas Cíes (Espanha)");""");
    await database.rawInsert(
        """INSERT INTO PROTAREA (latitude, longitude, description) VALUES (36.6820, -121.8022, "Santuário Marinho de Monterey Bay (Califórnia, EUA)");""");
    await database.rawInsert('''
  INSERT INTO PROTAREA (latitude, longitude, description)
  VALUES (-5.3522, 72.7682, "Área de Conservação Marinha de Chagos (Reino Unido)");
''');

    await database.rawInsert('''
  INSERT INTO PROTAREA (latitude, longitude, description)
  VALUES (-3.8833, -32.3833, "Área de Proteção Ambiental Marinha de Fernando de Noronha-Rocas-São Pedro e São Paulo (Brasil)");
''');

    await database.rawInsert('''
  INSERT INTO PROTAREA (latitude, longitude, description)
  VALUES (-14.5667, -168.1333, "Monumento Nacional Marinho de Rose Atoll (Samoa Americana)");
''');

    await database.rawInsert('''
  INSERT INTO PROTAREA (latitude, longitude, description)
  VALUES (30.1500, -15.8833, "Área de Conservação Marinha das Ilhas Selvagens (Portugal)");
''');

    await database.rawInsert('''
  INSERT INTO PROTAREA (latitude, longitude, description)
  VALUES (-0.7500, 130.8333, "Parque Nacional Marinho de Raja Ampat (Indonésia)");
''');

    await database.rawInsert('''
  INSERT INTO PROTAREA (latitude, longitude, description)
  VALUES (7.5000, 134.5000, "Área de Conservação Marinha de Palau (Palau)");
''');

    await database.rawInsert('''
  INSERT INTO PROTAREA (latitude, longitude, description)
  VALUES (51.1670, -4.6651, "Reserva Natural Marinha de Lundy (Reino Unido)");
''');

    await database.rawInsert('''
  INSERT INTO PROTAREA (latitude, longitude, description)
  VALUES (3.9833, -81.6167, "Área de Conservação Marinha de Malpelo (Colômbia)");
''');

    await database.rawInsert('''
  INSERT INTO PROTAREA (latitude, longitude, description)
  VALUES (3.9833, -81.6167, "Parque Nacional Marinho das Ilhas Malpelo (Colômbia)");
''');

    await database.rawInsert('''
  INSERT INTO PROTAREA (latitude, longitude, description)
  VALUES (37.6150, -0.7050, "Reserva Marinha Cabo de Palos-Islas Hormigas (Espanha)");
''');

    await database.rawInsert('''
  INSERT INTO PROTAREA (latitude, longitude, description)
  VALUES (-5.3333, 123.7500, "Parque Nacional Marinho de Wakatobi (Indonésia)");
''');

    await database.rawInsert('''
  INSERT INTO PROTAREA (latitude, longitude, description)
  VALUES (-24.0000, -45.0000, "Área de Proteção Ambiental Marinha de Laje de Santos (Brasil)");
''');

    await database.rawInsert('''
  INSERT INTO PROTAREA (latitude, longitude, description)
  VALUES (20.6865, -105.5653, "Parque Nacional Marinho das Ilhas Marietas (México)");
''');

    await database.rawInsert('''
  INSERT INTO PROTAREA (latitude, longitude, description)
  VALUES (39.2167, 2.1833, "Área Marinha Protegida das Ilhas Baleares (Espanha)");
''');

    await database.rawInsert('''
  INSERT INTO PROTAREA (latitude, longitude, description)
  VALUES (-36.2500, 174.9167, "Reserva Marinha de Cape Rodney-Okakari Point (Nova Zelândia)");
''');
  }

  static Future<List<ProtArea>?> getAllProtectedAreas() async {
    try {
      final db = await initDB();

      final List<Map<String, dynamic>> maps = await db.query("PROTAREA");

      return List.generate(maps.length, (index) {
        return ProtArea.fromJson(maps[index]);
      });
    } catch (e) {
      print("Error pa: $e");
    }
  }

  static Future<List<FishArea>?> getAllFishAreas() async {
    try {
      final db = await initDB();

      final List<Map<String, dynamic>> maps = await db.rawQuery('''
        SELECT FISHAREA.*, FISH.*
        FROM FISHAREA
        JOIN fish ON FISHAREA.fish = FISH.idFish
      ''');

      return List.generate(maps.length, (index) {
        return FishArea.fromJson(maps[index]);
      });
    } catch (e) {
      print("Error fa: $e");
    }
  }

  static Future<List<Recipe>?> getAllRecipes() async {
    try {
      final db = await initDB();

      final List<Map<String, dynamic>> maps = await db.rawQuery('''
        SELECT recipe.*, user.*
        FROM recipe
        JOIN user ON recipe.author = user.idUser
      ''');

      if (maps.isEmpty) {
        return null;
      }

      return List.generate(maps.length, (index) {
        return Recipe.fromJson(maps[index]);
      });
    } catch (e) {
      print("Error: $e");
    }
  }
}