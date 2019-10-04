import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(new MaterialApp(home: MyApp(),));

class MyApp extends StatelessWidget {
  
  void showToast(){
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Toast"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: (){
            showToast();
          },
          child: new Text("Show Toast"),
        ),
      ),
    );
  }
}