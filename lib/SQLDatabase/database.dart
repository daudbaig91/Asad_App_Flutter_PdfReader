import 'dart:async';

import 'package:asad_quran_app/BookMarkClass.dart';
import 'package:asad_quran_app/SQLDatabase/BookMarkModel.dart';
import 'package:asad_quran_app/SQLDatabase/surahModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../SurahClass.dart';


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

  Future<void> deleteModel(BookMarkModel bookmark) async {
    await openDb();
    await _database.rawDelete('DELETE FROM bookmark WHERE surah = ? AND parah = ? AND page = ? AND title = ? AND desc = ?' ,
      [bookmark.surah,bookmark.parah,bookmark.page,bookmark.title,bookmark.desc],);
  }
}

class DbManager2 {
  late Database _database;

  Future openDb() async {
    _database = await openDatabase(join(await getDatabasesPath(), "s2.db"),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute(
            "CREATE TABLE surah(surah INTEGER, page INTEGER)",
          );
          //,
        });
    return _database;
  }

  Future insertModel(SurahModel surahmodel) async {
    await openDb();
    return await _database.insert('surah',  surahmodel.toJson());
  }

  Future<List<SurahClass>> getModelList() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('surah');
    print(maps.length);
    return List.generate(maps.length, (i) {
      return SurahClass(
        surah: maps[i]['surah'],
        page: maps[i]['page'],
      );
    });
  }
  void getModelListlength() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('surah');
    print(maps.length);
  }

  Future<void> deleteModel(SurahModel surahModel) async {
    await openDb();
    await _database.delete('surah', where: "surah = ?", whereArgs: [surahModel.surah]);
  }
}
