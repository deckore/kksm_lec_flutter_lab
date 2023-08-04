import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: const Text('Random.Word'),
        ),
        body: Center(
          child: Text('${wordPair.first}'),
        ),
      ),
    );
  }
}