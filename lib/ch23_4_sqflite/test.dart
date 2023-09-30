import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: NativePluginWidget(),
    );
  }
}

class User {
  int? id;
  String? name;
  String? address;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{"name": name, "address": address};
    if (id != null) map["id"] = id;
    return map;
  }

  User.fromData(this.name, this.address);
  User.fromMap(Map<String, Object?> map) {
    id = map["id"] as int;
    name = map["name"] as String;
    address = map["address"] as String;
  }
}

class NativePluginWidget extends StatefulWidget {
  const NativePluginWidget({super.key});

  @override
  State<NativePluginWidget> createState() => _NativePluginWidgetState();
}

class _NativePluginWidgetState extends State<NativePluginWidget> {

  @override
  void initState() {
    super.initState();
    _createTable();
  }

  var db;
  _createTable() async {
    db = await openDatabase("my_db.db", version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
CREATE TABLE User (
  id INTEGER PRIMARY KEY,
  name TEXT,
  address TEXT
)
      ''');
    }, onUpgrade: (Database db, int oldVersion, int newVersion) {});
  }

  int lastId = 0;

  insert() async {
    lastId++;
    User user = User.fromData("name$lastId", "seoul$lastId");
    lastId = await db.insert("User", user.toMap());
    print('${user.toMap()}');
  }

  update() async {
    User user = User.fromData("name${lastId - 1}", "seoul${lastId - 1}");
    await db.update("User", user.toMap(), where: "id=?", whereArgs: [lastId]);
  }

  delete() async {
    await db.delete('User', where: 'id=?', whereArgs: [lastId]);
    lastId--;
  }

  query() async {
    List<Map> maps = await db.query(
      'User',
      columns: ['id', 'name', 'address'],
    );
    List<User> users = List.empty(growable: true);
    maps.forEach((element) {
      users.add(User.fromMap(element as Map<String, Object?>));
    },);

    if (maps.length > 0) {
      print('select: ${maps.first}');
    }

    users.forEach((element) {
      print('${element.name}');}
    );
  }

  TextStyle txtStyle01 = const TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shared Preferences")),
      body: Container(
        color: Colors.indigo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: insert,
                child: const Text("insert"),
              ),
              ElevatedButton(
                onPressed: update,
                child: const Text("update"),
              ),
              ElevatedButton(
                onPressed: delete,
                child: const Text("delete"),
              ),
              ElevatedButton(
                onPressed: query,
                child: const Text("query"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
