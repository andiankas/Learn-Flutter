import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Row & Column"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ // children <Widget> merupakan kumpulan dari beberapa widget
            Text("Text 1"),
            Text("Text 2"),
            Text("Text 3"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Text 4"),
                Text("Text 5"),
                Text("Text 6"),
              ],
            ),
          ],
        ),
        
      ),
    );
  }
}