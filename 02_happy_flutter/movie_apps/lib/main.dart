import 'package:flutter/material.dart';
import 'home_berita.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie Apps",
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: DataBeritaHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}