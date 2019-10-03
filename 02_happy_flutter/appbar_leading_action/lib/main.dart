import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: new Application()));

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

  String txt = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange,
        title: new Text("AppBar Widget"),
        leading: new Icon(Icons.menu),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.access_time),
            onPressed: (){
              txt = "This is arrow button 1";
            },
          ),
          new IconButton(
            icon: new Icon(Icons.data_usage),
            onPressed: (){
              txt = "This is arrow button 2";
            },
          ),
        ],
      ),
      body: new Container(
        child: new Center(
          child: new Text(txt),
        ),
      )
    );
  }
}

