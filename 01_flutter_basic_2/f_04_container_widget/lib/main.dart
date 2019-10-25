import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Container"),
        ),
        body: Container(
          color: Colors.red,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Container(
            color: Colors.blue,
            margin: EdgeInsets.all(10),
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.yellow,
                    Colors.black
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}