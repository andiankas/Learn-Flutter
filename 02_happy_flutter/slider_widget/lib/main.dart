import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  double drag = 1000000.0;
  void method1(value){
    setState(() {
      drag = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Slider Widget",
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          title: new Text("Drag Slider"),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Slider(
                value: drag,
                min: 1000000.0,
                max: 30000000.0,
                onChanged: (double val){
                  method1(val);
                },
              ),
              new Text("value : $drag"),
            ],
          ),
        ),
      ),
    );
  }
}

