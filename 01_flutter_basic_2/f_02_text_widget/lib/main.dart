import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "f_02_text_widget",
      home: Scaffold(
        // scaffold sama hal nya dengan activity kalau di android native
        appBar: AppBar(
          title: Text("Text Widget"),
        ),
        body: Center(
          child: Container(
            color: Colors.blue[200],
            width: 150,
            height: 70,
            child: Text(
              "Bismillahirahmanirahim. Saya sedang belajar flutter. Semangat!!!",
              style: TextStyle(
                color: Colors.blue[900],
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
