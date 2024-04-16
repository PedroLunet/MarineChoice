import "dart:io";
import "dart:typed_data";

import "package:flutter/services.dart";
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";

class DataBaseHelperFilters {
  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "tables.sql");
    
    final exist = await databaseExists(path);

    if(exist) {
      print("database already exists");
    }
    else {
      print("creating a copy from assets...");
      try {
        await Directory(dirname(path)).create(recursive:true);
      }
      catch(_) {
        ByteData data_1 = await rootBundle.load(join("assets", "tables.sql"));
        List<int> bytes = data_1.buffer.asUint8List(data_1.offsetInBytes, data_1.lengthInBytes);
        
        await File(path).writeAsBytes(bytes, flush: true);
      }

      print("db copied");
    }
    var database = await openDatabase(path);

    return database;
  }
}