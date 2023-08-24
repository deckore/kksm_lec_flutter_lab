import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    const Text("First Screen",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    const Text("Second Screen",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    const Text("Third Screen",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    const Text("Fourth Screen",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Scaffold AppBar Test"),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Theme(
              data: Theme.of(context).copyWith(focusColor: Colors.white),
              child: Container(
                height: 48,
                alignment: Alignment.center,
                child: Text("AppBar Bottom Text"),
              ),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("resources/images/20210117_114428.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.add_alert)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
          ],
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "First",
                backgroundColor: Colors.black12),
            BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: "Second",
                backgroundColor: Colors.black26),
            BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: "Third",
                backgroundColor: Colors.black38),
            BottomNavigationBarItem(
                icon: Icon(Icons.park),
                label: "Fourth",
                backgroundColor: Colors.black45),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(color: Colors.blueGrey),
              ),
              ListTile(title: Text("Item - 1"), onTap: () {}),
              ListTile(title: Text("Item - 2"), onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
