import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  bool enabled = false;
  String stateText = "Disabled";

  void changeCheck() {
    if (enabled) {
      stateText = "Enabled";
      enabled = false;
    } else {
      stateText = "Enable";
      enabled = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stateless Widget'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
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
        ),
      ),
    );
  }
}