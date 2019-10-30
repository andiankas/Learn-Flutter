import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String _text = "Ini text sebelum di click";

  // void _changeText() {
  //   setState(() {
  //     _text = "After clicked";
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Anonymous Method"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_text),
              RaisedButton(
                child: Text("Click"),
                onPressed: (){
                  setState(() {
                    _text = "After clicked";
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}