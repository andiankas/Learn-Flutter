import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         leading: Image.asset("img/logo.png"),
         title: Text("Simple Note", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300,),),
         backgroundColor: Colors.black,
       ),
       body: Container(),
    );
  }
}