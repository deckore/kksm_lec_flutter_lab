import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Channel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NativeCallWidget(),
    );
  }
}

class NativeCallWidget extends StatefulWidget {
  const NativeCallWidget({super.key});

  @override
  State<NativeCallWidget> createState() => _NativeCallWidgetState();
}

class _NativeCallWidgetState extends State<NativeCallWidget> {
  String? resultMessage;
  String? receiveMessage;

  Future<Null> nativeCall() async {
    const channel =
        BasicMessageChannel<String>('myMessageChannel', StringCodec());
    String? result = await channel.send("Hello from Dart");
    setState(() {
      resultMessage = result;
    });
    channel.setMessageHandler(
      (String? message) async {
        setState(() {
          receiveMessage = message;
        });
        return "Reply from Dart";
      },
    );
  }

  TextStyle txtStyle01 = const TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Message Channel"),
      ),
      body: Container(
        color: Colors.deepPurpleAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("resultMessage: $resultMessage", style: txtStyle01),
              Text("receiveMessage: $receiveMessage", style: txtStyle01),
              ElevatedButton(
                onPressed: nativeCall,
                child: const Text("Native Call"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
