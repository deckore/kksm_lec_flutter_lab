import 'package:flutter/material.dart';

import 'first_screen.dart';
import 'second_screen.dart';
import 'third_screen.dart';
import 'fourth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/First",
      routes: {
        "/First": (context) => FirstScreen(),
        "/Second": (context) => SecondScreen(),
        // "/Third": (context) => ThirdScreen(),
        // "/Fourth": (context) => FourthScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "/Third") {
          return MaterialPageRoute(
            builder: (context) => ThirdScreen(),
            settings: settings,
          );
        } else if (settings.name == "/Fourth") {
          return MaterialPageRoute(
            builder: (context) => FourthScreen(),
            settings: settings,
          );
        }
      },
    );
  }
}
