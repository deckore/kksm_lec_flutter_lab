import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class User {
  String name;
  String address;
  User(this.name, this.address);
}

abstract class UserEvent {
  User user;
  UserEvent(this.user);
}

class CreateUserEvnet extends UserEvent {
  CreateUserEvnet(User user) : super(user);
}

class UpdateUserEvent extends UserEvent {
  UpdateUserEvent(User user) : super(user);
}

class UserBloc extends Bloc<UserEvent, User?> {
  UserBloc() : super(null) {
    on<CreateUserEvnet>((event, emit) => emit(event.user));
    on<UpdateUserEvent>((event, emit) => emit(event.user));
  }
}

abstract class CounterEvent {
  int no;
  CounterEvent(this.no);
}

class IncrementEvent extends CounterEvent {
  IncrementEvent(int no) : super(no);
}

class DecrementEvent extends CounterEvent {
  DecrementEvent(int no) : super(no);
}

class BlocCounter extends Bloc<CounterEvent, int> {
  BlocCounter() : super(0) {
    on<IncrementEvent>((event, emit) {
      emit(state + event.no);
    });
    on<DecrementEvent>((event, emit) {
      emit(state - event.no);
    });
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    print("onTransition... $transition");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}

class MyBlockObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print("Observer onTransition... $transition");
  }
}

void main() {
  BlocOverrides.runZoned(() {
    runApp(MyApp());
  }, blocObserver: MyBlockObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("BlocObserver, BlocListener Test")),
        body: MultiBlocProvider(
          providers: [
            BlocProvider<BlocCounter>(
              create: (context) => BlocCounter(),
            ),
            BlocProvider<UserBloc>(create: (context) => UserBloc()),
          ],
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BlocCounter counterBloc = BlocProvider.of<BlocCounter>(context);
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return BlocBuilder<BlocCounter, int>(
      builder: (context, count) {
        return MultiBlocListener(
          listeners: [
            BlocListener<BlocCounter, int>(
              listenWhen: (previous, current) {
                return true;
              },
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("$state"),
                    backgroundColor: Colors.red,
                  )
                );
              },
            ),
            BlocListener<UserBloc, User?>(
              listenWhen: (previous, current) {
                return true;
              },
              listener: (context, user) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${user!.name}"),
                    backgroundColor: Colors.red,
                  )
                );
              },
            ),
          ],
          child: Container(
            color: Colors.deepOrange,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<BlocCounter, int>(
                    buildWhen: (previous, current) {
                      return true;
                    },
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${counterBloc.state}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              )
                          ),
                          Text("Bloc : ${count}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              )
                          ),
                          ElevatedButton(
                            onPressed: () {
                              counterBloc.add(IncrementEvent(2));
                            },
                            child: Text("Increment"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              counterBloc.add(DecrementEvent(2));
                            },
                            child: Text("Decrement"),
                          ),
                        ],
                      );
                    },
                  ),
                  BlocBuilder<UserBloc, User?>(
                    builder: (context, user) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Text("User : ${user?.name}, ${user?.address}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              userBloc.add(CreateUserEvnet(User("Kwon", "Seoul")));
                            },
                            child: Text("create"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              userBloc.add(UpdateUserEvent(User("Deck", "Yongin")));
                            },
                            child: Text("update"),
                          ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
