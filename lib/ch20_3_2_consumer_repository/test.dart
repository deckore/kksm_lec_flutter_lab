import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyRepository {
  someFun() {
    print("......someFun......");
  }
}

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class BlocCounter extends Bloc<BlocCounter, int> {
  BlocCounter() : super(0) {
    on<IncrementEvent>((event, emit) {
      emit(state + 1);
    });
    on<DecrementEvent>(
      (event, emit) => emit(state - 1),
    );
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
          title: const Text("Consumer, Repository"),
        ),
        body: RepositoryProvider(
          create: (context) => MyRepository(),
          child: BlocProvider<BlocCounter>(
            create: (context) => BlocCounter(),
            child: MyWidget(),
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
