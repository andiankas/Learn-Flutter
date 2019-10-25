import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "f_01_HelloWorld",
      home: Scaffold(
        // scaffold sama hal nya dengan activity kalau di android native
        appBar: AppBar(
          title: Text("AppBar Hello World"),
        ),
        body: Center(
          child: Text("Hello Wolrd")
        ),
      ),
    );
  }
}
