import 'package:flutter/material.dart';

import 'user.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, Object> args = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Second Screen"),
        ),
        body: Container(
          color: Colors.cyan,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Second Screen",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Text("sendData: ${args['arg1']}, ${args['arg2']}, ${(args['arg3'] as User).name}"),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/Third");
                  },
                  child: const Text("Go Third"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, User("Lee", "YongIn"));
                  },
                  child: const Text("Pop"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
