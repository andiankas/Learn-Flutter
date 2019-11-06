import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Widget> _widgetList = [];

  // constructor
  _MyAppState() {
    for (var i = 0; i < 21; i++) {
      _widgetList.add(Text("Data ke - " + i.toString(), style: TextStyle(fontSize: 50),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Listview"),
        ),
        body: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("Tambah"),
                  onPressed: null,
                ),
                RaisedButton(
                  child: Text("Hapus"),
                  onPressed: null,
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
