import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget platformUI() {
    if (Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: const CupertinoThemeData(brightness: Brightness.light),
        home: CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(middle: Text("Cupertino Title")),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(child: Text('click'), onPressed: () {},),
              const Center(
                child: Text('HelloWorld'),
              ),
            ],
          ),
        ),
      );
    } else if (Platform.isAndroid) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text("Material Title")),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("Click")),
              const Center(
                child: Text("HelloAndroidWorld"),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Text(
        "Unknown Device",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return platformUI();
  }
}