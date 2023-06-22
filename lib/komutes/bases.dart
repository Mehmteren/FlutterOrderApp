import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final String databaseNot = 'myNotlarım.db';
  final TextEditingController notController = TextEditingController();
  List<Map<String, dynamic>> queryResults = [];

  @override
  void initState() {
    super.initState();
    _queryData();
  }

  Future<Database> _openDatabase() async {
    final String databasePath = await getDatabasesPath();
    final String path = join(databasePath, databaseNot);

    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db
          .execute('CREATE TABLE myTable (id INTEGER PRIMARY KEY, name TEXT)');
    });
  }

  Future<void> _addData() async {
    final Database database = await _openDatabase();
    final String not = notController.text;

    await database.insert('myTable', {'name': not});
    _queryData();
  }

  Future<void> _queryData() async {
    final Database database = await _openDatabase();
    final List<Map<String, dynamic>> rows = await database.query('myTable');
    setState(() {
      queryResults = rows;
    });
  }

  Future<void> _deleteData(int id) async {
    final Database database = await _openDatabase();
    await database.delete('myTable', where: 'id = ?', whereArgs: [id]);
    _queryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: Text('Yemekcii'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/sosis.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.lime,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Not Ekle ',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.lime[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: notController,
                  style: TextStyle(
                    color: Colors.lime, // Yazı rengi lime olarak güncellendi
                  ),
                  decoration: InputDecoration(
                    labelText: 'Not',
                    labelStyle: TextStyle(
                      color: Colors.lime,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: _addData,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lime,
                  ),
                  child: Text('Notunu Kaydet'),
                ),
              ),
              SizedBox(height: 100),
              Container(
                decoration: BoxDecoration(
                  color: Colors.lime,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Kayıtlı Notlar:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lime,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(queryResults.length, (index) {
                        final row = queryResults[index];
                        return ListTile(
                          title: Text(
                            'Not: ${row['name']}',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteData(row['id']);
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
