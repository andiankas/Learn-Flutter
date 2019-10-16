import 'package:crud_sqflite/screen/home.dart';
import 'package:flutter/material.dart';

main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'Simple Note',
       debugShowCheckedModeBanner: false,
       home: Home(),
    );
  }
}