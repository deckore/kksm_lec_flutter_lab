import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class User {
  String name;
  String phone;
  String email;

  User(this.name, this.phone, this.email);
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  List<User> users = [
    User('금수저', '01001', 'gold@email.com'),
    User('은수저', '01002', 'silver@email.com'),
    User('동수저', '01003', 'bronze@email.com'),
    User('흙수저', '01004', 'dirt@email.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ListView Test"),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      AssetImage('resources/images/20210117_114835.jpg'),
                ),
                title: Text("${users[index].name}"),
                subtitle: Text("${users[index].phone}"),
                trailing: Icon(Icons.more_horiz),
                onTap: () {
                  print(users[index].name);
                  print(users[index].email);
                });
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 2,
              color: Colors.black,
            );
          },
          itemCount: users.length,
        ),
      ),
    );
  }
}
