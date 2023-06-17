import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  final String databaseName = 'myDatabase.db';
  final String databasePath = await getDatabasesPath();
  final String path = join(databasePath, databaseName);

  final Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE myTable (id INTEGER PRIMARY KEY, name TEXT, value INTEGER)');
  });

  // Veri ekleme
  await database.insert('myTable', {'name': 'John', 'value': 25});

  // Veri güncelleme
  await database.update('myTable', {'value': 30},
      where: 'name = ?', whereArgs: ['John']);

  // Tüm verileri sorgulama
  final List<Map<String, dynamic>> rows = await database.query('myTable');

  // İsim bazında veri sorgulama
  final List<Map<String, dynamic>> johnRows =
      await database.query('myTable', where: 'name = ?', whereArgs: ['John']);

  // Veri silme
  await database.delete('myTable', where: 'name = ?', whereArgs: ['John']);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SQLite Example'),
        ),
        body: Center(
          child: Text('SQLite operations performed successfully!'),
        ),
      ),
    );
  }
}
