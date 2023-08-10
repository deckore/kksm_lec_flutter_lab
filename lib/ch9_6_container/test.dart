import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Use Container')),
        body: Container(
          height: Size.infinite.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.red,
                Colors.yellow,
                Colors.white,
                Colors.yellowAccent,
                Colors.redAccent,
              ],
            ),
          ),
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('resources/images/20210117_114428.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}