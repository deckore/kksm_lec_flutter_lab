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
        appBar: AppBar(title: const Text("CheckBox & Radio Example")),
        body: TestScreen(),
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool? isChecked = true;
  String? selectPlatform;
  double sliderValue = 5.0;
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Checkbox Test'),
        Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value;
                });
              }
            ),
            Text("CheckBox value is ${isChecked}"),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 'Android',
              groupValue: selectPlatform,
              onChanged: (String? value) {
                setState(() {
                  selectPlatform = value;
                });
              },
            ),
            const Text("Android"),
            Radio(
              value: 'IOS',
              groupValue: selectPlatform,
              onChanged: (String? value) {
                setState(() {
                  selectPlatform = value;
                });
              },
            ),
            const Text("IOS"),
          ],
        ),
        Text("Select Platform is ${selectPlatform}"),
        const SizedBox(height: 20,),
        const Text('Slider Test'),
        Slider(
          value: sliderValue,
          min: 0,
          max: 10,
          onChanged: (double value) {
            setState(() {
              sliderValue = value;
            });
          }
        ),
        Text('Slider value is ${sliderValue}'),
        const SizedBox(height: 20,),
        const Text('Switch Test'),
        Switch(
          value: switchValue,
          onChanged: (bool value) {
            setState(() {
              switchValue = value;
            });
          }
        ),
        Text('Switch value is ${switchValue}'),
      ],
    );
  }
}