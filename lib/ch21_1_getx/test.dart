import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class CounterController extends GetxController {
  int count = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() {
    count++;
    update();
  }

  void decrement() {
    count--;
    update();
  }
}

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("GetX")),
        body: GetBuilder(
          init: CounterController(),
          builder: (_) {
            return MyWidget();
          }
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(
      builder: (controller) {
        return Container(
          color: Colors.deepOrange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("GetX : ${controller.count}", style: const TextStyle(color: Colors.white, fontSize: 20)),
              ElevatedButton(onPressed: () => controller.increment(), child: const Text("Increment")),
              ElevatedButton(onPressed: () => controller.decrement(), child: const Text("Decrement")),
            ],
          ),
        );
      },
    );
  }
}