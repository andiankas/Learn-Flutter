import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void dialog(){
    showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text("Warning"),
        content: new Text("Anda yakin ingin keluar ?"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Alert Dialog"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: (){
            dialog();
          },
          child: new Text("Alert Dialog"),
        ),
      ),
    );
  }
}

