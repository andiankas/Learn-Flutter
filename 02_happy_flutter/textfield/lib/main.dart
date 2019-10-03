import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String text = "";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Dummy Application",
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[500],
          title: new Text("Texfield Widget"),
        ),
        body: new Column(
          children: <Widget>[
            new TextField(
              onChanged: (String txtInput){
                setState(() {
                  text = txtInput;
                });
              },
              decoration: new InputDecoration(hintText: "Username", labelText: "Username"),
            ),
            new Text(text)
          ],
        ),
      ),
    );
  }
}

