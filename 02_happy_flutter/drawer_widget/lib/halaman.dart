import 'package:flutter/material.dart';

class pagebaru extends StatelessWidget {
  
  final String menu;
  pagebaru(this.menu);
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("$menu"),
      ),
      body: new Center(
        child: new Text("$menu"),
      ),
    );
  }
}