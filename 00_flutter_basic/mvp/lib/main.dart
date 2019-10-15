import 'package:flutter/material.dart';
import 'package:mvp/view/myhomepage.dart';
import 'package:mvp/presenter/presenter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo MVP",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(
        new BasicAppPresenter(),
        title: "Flutter Demo MVP"
      ),
    );
  }
}
