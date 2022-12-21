import 'dart:async';

import 'package:asad_quran_app/BookMarkClass.dart';
import 'package:asad_quran_app/SQLDatabase/BookMarkModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DbManager {
  late Database _database;

  Future openDb() async {
    _database = await openDatabase(join(await getDatabasesPath(), "ss.db"),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute(
            "CREATE TABLE bookmark(surah TEXT, parah TEXT, page INTEGER, "
                "title TEXT, desc TEXT)",
          );
          //,
        });
    return _database;
  }

  Future insertModel(BookMarkModel bookmark) async {
    await openDb();
    print("opened");
    return await _database.insert('bookmark',  bookmark.toJson());

  }

  Future<List<BookMarkClass>> getModelList() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('bookmark');
    print(maps.length);
    return List.generate(maps.length, (i) {
      return BookMarkClass(
          surah: maps[i]['surah'],
          parah: maps[i]['parah'],
          page: maps[i]['page'],
          title: maps[i]['title'],
          desc: maps[i]['desc'],
      );
    });
  }
  void getModelListlength() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('bookmark');
    print(maps.length);
  }
  // Future<int> updateModel(BookMarkModel bookmark) async {
  //   await openDb();
  //   return await _database.update('bookmark', bookmark.toJson(),
  //       where: "id = ?", whereArgs: [bookmark.index]);
  // }

  // Future<void> deleteModel(BookMarkModel bookmark) async {
  //   await openDb();
  //   await _database.delete('bookmark', where: "integer = ?", whereArgs: [bookmark.index]);
  // }
}