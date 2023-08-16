import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  List<String> citys = ['서울시', '인천시', '부산시', '대구시', '대전시', '광주시', '울산시', '세종시'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("GridView Test")),
        body: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Text(citys[index]),
                  Image.asset('resources/images/20210117_114428.jpg'),
                ],
              ),
            );
          },
          itemCount: citys.length,
        ),
      ),
    );
  }
}