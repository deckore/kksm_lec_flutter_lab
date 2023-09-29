import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: NativePluginWidget(),
    );
  }
}

class NativePluginWidget extends StatefulWidget {
  const NativePluginWidget({super.key});

  @override
  State<NativePluginWidget> createState() => _NativePluginWidgetState();
}

class _NativePluginWidgetState extends State<NativePluginWidget> {

  late SharedPreferences prefs;
  double sliderValue = 0.0;
  bool switchValue = false;

  _save() async {
    await prefs.setDouble("slider", sliderValue);
    await prefs.setBool('switch', switchValue);
  }

  getInitData() async {
    prefs = await SharedPreferences.getInstance();
    sliderValue = prefs.getDouble("slider") ?? 0.0;
    switchValue = prefs.getBool("switch") ?? false;
    setState(() {
      
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInitData();
  }

  TextStyle txtStyle01 = const TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shared Preferences")),
      body: Container(
        color: Colors.indigo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(
                value: sliderValue,
                min: 0,
                max: 10,
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;;
                  });
                },
              ),
              Switch(
                value: switchValue,
                onChanged: (bool value) {
                  setState(() {
                    switchValue = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: _save,
                child: const Text("save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
