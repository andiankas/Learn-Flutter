import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: MyApp(),));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  SimpleDialog sd;

  void dialog(){
    sd = new SimpleDialog(
      title: new Text("Pilih Salah Satu"),
      children: <Widget>[
        new SimpleDialogOption(
          child: new Text("Jakarta"),
          onPressed: (){
            print("Jakarta");
          },
        ),
        new SimpleDialogOption(
          child: new Text("Bandung"),
          onPressed: (){
            print("Bandung");
          },
        ),
        new SimpleDialogOption(
          child: new Text("Close"),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ],
    );
    showDialog(context: context,child: sd);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Notification Widget"),
        backgroundColor: Colors.blue,
      ),
      body: new Center(
        child: new RaisedButton( // raised button untuk bikin button
          onPressed: (){
            dialog();
          },
          child: new Text("Show Simple Dialog"),
        ),
      ),
    );
  }
}

