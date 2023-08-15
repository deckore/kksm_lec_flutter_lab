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
  final _formKey = GlobalKey<FormState>();
  String? firstName;
  String? lastName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Form Test"),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "FirstName",
                ),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Please enter first name';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  firstName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "LastName",
                ),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Please enter last name';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  lastName = value;
                },
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              _formKey.currentState?.save();
              print("FirstName: ${firstName}, LastName: ${lastName}");
            }
          },
          child: const Text("Submit"),
        ),
      ],
    );
  }
}