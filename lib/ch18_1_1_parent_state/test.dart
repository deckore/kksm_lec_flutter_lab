import 'package:flutter/material.dart';

void main() {
  runApp(ParentWidget());
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool favorited = false;
  int favoriteCount = 10;

  void toggleFavorite() {
    setState(() {
      if (favorited) {
        favoriteCount -= 1;
        favorited = false;
      } else {
        favoriteCount += 1;
        favorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Parent State")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconWidget(favorited: favorited, onChanged: toggleFavorite),
            ContentWidget(favoriteCount: favoriteCount,),
          ],
        ),
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  //const IconWidget({super.key});

  final bool favorited;
  final Function onChanged;

  IconWidget({this.favorited: false, required this.onChanged});

  void _handleTap() {
    onChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: (favorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
        iconSize: 200,
        color: Colors.red,
        onPressed: _handleTap,
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  //const ContentWidget({super.key});

  final int favoriteCount;
  ContentWidget({required this.favoriteCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text("favoriteCount: ${favoriteCount}", style: const TextStyle(fontSize: 20),),
        ),
      ],
    );
  }
}