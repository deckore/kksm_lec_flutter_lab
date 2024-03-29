import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

//part 'test.g.dart';
/**
 * failed
   flutter pub run build_runner build
 */

/*
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String jsonStr = '{"id": 1, "title": "Hello", "completed": false, "location": {"latitude": "37.5", "longitude": "127.1"}}';
  
  Todo? todo;
  String result = '';

  onPressDecode() {
    Map<String, dynamic> map = jsonDecode(jsonStr);
    todo = Todo.fromJson(map);
    setState(() {
      //result = "DECODE] id: ${todo?.id}, title: ${todo?.title}, completed: ${todo?.completed}";
      result = "DECODE] ${todo?.toJson()}";
    });
  }

  onPressEncode() {
    setState(() {
      result = "ENCODE] ${jsonEncode(todo)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Json Parser Test")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${result}"),
              ElevatedButton(onPressed: onPressDecode, child: const Text("DECODE")),
              ElevatedButton(onPressed: onPressEncode, child: const Text("ENCODE")),
            ],
          ),
        ),
      ),
    );
  }
}

@JsonSerializable()
class Location {
  String latitude;
  String longitude;
  Location(this.latitude, this.longitude);
  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Todo {
  @JsonKey(name: "id")
  int todoId;
  String title;
  bool completed;
  Location location;

  Todo(this.todoId, this.title, this.completed, this.location);
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
*/