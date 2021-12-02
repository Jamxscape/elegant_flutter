import 'dart:developer';

import 'package:elegant_flutter/sqlite/sqflite/dog.dart';
import 'package:elegant_flutter/sqlite/sqflite/expect.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteController extends GetxController {
  Rx<Dog> fidoRx = Dog(age: 0, id: 0, name: '未定义').obs;
  @override
  Future<void> initData() async {}

  Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), 'doggie_database.db');

    final db = await openDatabase(path);
    try {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS dogs (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
    } catch (e) {
      log(e.toString());
    }
    return db;
  }

  // 增
  Future<void> insertDB(Dog dog) async {
    final db = await initDB();
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // 查
  Future<void> dogs() async {
    final db = await initDB();
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    final List<Dog> dogs = maps
        .map((e) => Dog(
              id: e['id'],
              name: e['name'],
              age: e['age'],
            ))
        .toList();

    // List.generate(maps.length, (i) {
    //   return Dog(
    //     id: maps[i]['id'],
    //     name: maps[i]['name'],
    //     age: maps[i]['age'],
    //   );
    // });
    if (dogs.length > 0) {
      fidoRx.value = dogs.elementAt(0);
    } else {
      fidoRx.value = Dog(age: 0, id: 0, name: '未定义');
    }
  }

  // 改
  Future<void> updateDog(Dog dog) async {
    final db = await initDB();

    await db.update(
      'dogs',
      dog.toMap(),
      where: 'id = ?',
      whereArgs: [dog.id],
    );
  }

  // 删除
  Future<void> deleteDog(int id) async {
    final db = await initDB();
    await db.delete(
      'dogs',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
