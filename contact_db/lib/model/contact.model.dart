import 'package:contact_db/model/contact.db.dart';
import 'package:contact_db/model/contact.dto.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sql.dart';

class ContactModel with ChangeNotifier {
  final tableName = 'contact';
  Future<void> save(ContactDto dto) async {
    final db = await ContactDb.instance.database;
    if (dto.id == 0) {
      await db.insert(
        tableName,
        dto.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      await db.update(
        tableName,
        dto.toMap(),
        where: "id: ?",
        whereArgs: [dto.id],
      );
    }
    notifyListeners();
  }

  Future<void> delete(int id) async {
    final db = await ContactDb.instance.database;
    await db.delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    notifyListeners();
  }

  Future<ContactDto?> findById(int id) async {
    final db = await ContactDb.instance.database;
    final result = await db.query(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return ContactDto.from(result[0]);
    }

    return null;
  }

  Future<List<ContactDto>> getAll() async {
    final db = await ContactDb.instance.database;
    final result = await db.query(tableName);
    return List.from(result.map((e) => ContactDto.from(e)));
  }
}
