import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  final bool _isDeepLink = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator Test',
      home: Navigator(
        pages: [
          MaterialPage(child: OneScreen()),
          if (_isDeepLink) MaterialPage(child: TwoScreen()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}

class OneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("One Screen"),
      ),
      body: Container(
        color: Colors.amberAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("One Screen", style: TextStyle(fontSize: 30, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}

class TwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Two Screen"),
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Two Screen", style: TextStyle(fontSize: 30, color: Colors.white)),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Pop"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}