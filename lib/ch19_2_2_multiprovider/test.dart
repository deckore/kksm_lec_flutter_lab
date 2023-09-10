import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("MultiProvider Test"),),
        body: MultiProvider(
          providers: [
            Provider<int>.value(value: 10),
            Provider<String>.value(value: "hello"),
            ChangeNotifierProvider<Counter>.value(value: Counter()),
          ],
          child: SubWidget(),
        ),
      ),
    );
  }
}

class SubWidget extends StatelessWidget {
  const SubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context);
    var int_data = Provider.of<int>(context);
    var str_data = Provider.of<String>(context);

    return Container(
      color: Colors.orange,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Provider: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Int data: ${int_data}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("String data: ${str_data}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Counter data: ${counter.count}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ElevatedButton(onPressed: () { counter.increment(); }, child: const Text("increment")),
          ],
        ),
      ),
    );
  }
}