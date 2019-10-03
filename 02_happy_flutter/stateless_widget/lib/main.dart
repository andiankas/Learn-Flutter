import 'package:flutter/material.dart';

void main() {
  runApp(new statelesswidgetClass());
}

class statelesswidgetClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Stateless Widget",
      home: new Scaffold(
        body: new Container(
          color: Colors.blueAccent,
          child: new Container(
            color: Colors.lightGreen,
            margin: const EdgeInsets.all(50.0),
          ),
        ),
      ),
    );
  }
}