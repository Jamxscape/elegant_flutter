import 'dart:developer';

import 'package:elegant_flutter/lists/contacts/contact.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContactController extends GetxController {
  @override
  Future<void> initData() async {}

  Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), 'contact.db');

    final db = await openDatabase(path);
    try {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS contacts (id INTEGER PRIMARY KEY, userName TEXT, photo TEXT, phoneNum Text, cardID Text, remark Text)');
    } catch (e) {
      log(e.toString());
    }
    return db;
  }

  // 增
  Future<void> insertDB(Contact contact) async {
    final db = await initDB();
    await db.insert(
      'contacts',
      contact.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // 查
  Future<List<Contact>> read() async {
    final db = await initDB();
    final List<Map<String, dynamic>> maps = await db.query('contacts');
    return List.generate(maps.length, (i) {
      return Contact(
        id: maps[i]['id'],
        userName: maps[i]['userName'],
        photo: maps[i]['photo'],
        phoneNum: maps[i]['phoneNum'],
        cardID: maps[i]['cardID'],
        remark: maps[i]['remark'],
      );
    });
  }

  // 改
  Future<void> updatesDB(Contact contact) async {
    final db = await initDB();

    await db.update(
      'contacts',
      contact.toJson(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  // 删除
  Future<void> deleteDB(int id) async {
    final db = await initDB();
    await db.delete(
      'contacts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
