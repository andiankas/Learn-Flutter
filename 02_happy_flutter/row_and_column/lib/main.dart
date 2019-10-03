import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Row and Column",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Row and Column"),
        ),
        body: new Row( //row
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("This"),
            new Column( //column
              mainAxisAlignment:  MainAxisAlignment.center,
              children: <Widget>[
                new Text("This"),
                new Text("is"),
                new Text("Column")
              ],
            ),
            new Text("Row"),
          ],
        ),
      ),
    );
  }
}
