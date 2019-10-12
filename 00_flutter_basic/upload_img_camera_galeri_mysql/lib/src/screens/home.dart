import 'dart:io';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image"),
        backgroundColor: Colors.grey[850],
      ),
      body: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}