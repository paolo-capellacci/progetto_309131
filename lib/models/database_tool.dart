import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'package:progetto_309131/models/tool.dart';


class DatabaseTool {
  /*

  | ID primario | name   | diameter | Sharp  | length | Material | Teeth  |     cool     |
  | INTEGER     | string | double   | double | double | int      | int    | int          |
  | ============|========|==========|========|========|==========|========|==============|
  | 123         | tool 1 |  12.02   |  24.00 | 40.00  | [0; 5]   | [1-12] | [0; 1]       |

   */

  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'my_tool';

  // make this a singleton class
  DatabaseTool._privateConstructor();
  static final DatabaseTool instance = DatabaseTool._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;

  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);


  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            ${Tool.id_column} INTEGER PRIMARY KEY,
            ${Tool.name_column} TEXT NOT NULL,
            ${Tool.diameter_column} REAL NOT NULL,
            ${Tool.sharp_column} REAL NOT NULL,
            ${Tool.length_column} REAL NOT NULL,
            ${Tool.material_column} INTEGER NOT NULL,
            ${Tool.teeth_column} INTEGER NOT NULL,   
            ${Tool.cool_column} INTEGER NOT NULL
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Tool tool) async {
    Database db = await instance.database;
    return await db.insert(table, tool.toMap());

  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Tool>> getAllTools() async {

    Database db = await instance.database;
    final list =  await db.query(table);

    return list.map((json)=>Tool.fromJson(json)).toList();
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));

  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Tool tool) async {
    Database db = await instance.database;
    return await db.update(table, tool.toMap(), where: '${Tool.id_column} = ?', whereArgs: [tool.id]);

  }

  Future<int> updateMaterialWork(Tool tool) async {
    Database db = await instance.database;
    return await db.update(table, tool.toMap(), where: '${Tool.id_column} = ?', whereArgs: [tool.id]);

  }


  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(Tool tool) async {
    Database db = await instance.database;
    return await db.delete(table, where: '${Tool.id_column} = ?', whereArgs: [tool.id]);

  }

}