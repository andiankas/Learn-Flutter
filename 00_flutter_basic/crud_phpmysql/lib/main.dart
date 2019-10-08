import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(title: "My Store",home: new Home(),));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Store"),
      ),
    );
  }
}