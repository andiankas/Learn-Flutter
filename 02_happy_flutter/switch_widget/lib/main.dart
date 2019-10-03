import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: new MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  bool sbool = false;
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Dummy Application",
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          title: new Text("Switch Widget"),
        ),
        body: new Center(
          child: new Switch(
            value: sbool,
            onChanged: (bool sb){
              setState(() {
                sbool = sb;
                print(sb);
              });
            },
          ),
        ),
      ),
    );
  }
}
