import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Stream<int> streamFun() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("FutureProvider StreamProvider Test"),
        ),
        body: MultiProvider(
          providers: [
            FutureProvider<String>(
                create: (context) =>
                    Future.delayed(Duration(seconds: 4), () => "world"),
                initialData: "hello"),
            StreamProvider<int>(
              create: (context) => streamFun(),
              initialData: 0,
            ),
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
    var futureState = Provider.of<String>(context);
    var StreamState = Provider.of<int>(context);

    return Container(
      color: Colors.red,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("futureState: ${futureState}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("StreamState: ${StreamState}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
