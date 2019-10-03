import 'package:flutter/material.dart';

void main() {
  runApp(new application());
}

class application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Dummy Application",
      home: Scaffold(
        appBar: AppBar(
          title: new Text("List Widget"),
        ),
        body: new ListView(
          children: <Widget>[
            new ListTile(
              title: new Text("list item 1"),
              trailing: new Icon(Icons.arrow_forward),
            ),
            new ListTile(
              title: new Text("list item 2"),
              trailing: new Icon(Icons.arrow_forward),
            ),
            new ListTile(
              title: new Text("list item 3"),
              trailing: new Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
