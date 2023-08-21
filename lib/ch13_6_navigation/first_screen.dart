import 'package:flutter/material.dart';

import 'user.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("First Screen"),
        ),
        body: Container(
          color: Colors.cyan,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "First Screen",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      "/Second",
                      arguments: {
                        "arg1": 10,
                        "arg2": "Hello",
                        "arg3": User("Kwon", "Seoul"),
                      }
                    );
                    print("Result : ${(result as User).name}");
                  },
                  child: const Text("Go Second"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
