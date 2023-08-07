import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stateful Widget'),
        ),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  bool enabled = false;
  String stateText = "Disabled";

  void changeCheck() {
    setState(() {
      if (enabled) {
        stateText = "Disabled";
        enabled = false;
      } else {
        stateText = "Enabled";
        enabled = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: changeCheck,
            icon: (enabled ? const Icon(Icons.abc_sharp, size: 20) : const Icon(Icons.check_box_outline_blank, size: 20)),
            color: Colors.red,                
          ),
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "${stateText}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}