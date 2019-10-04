import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: MyApp(),));

class MyApp extends StatelessWidget {

  final GlobalKey<ScaffoldState> skey = new GlobalKey<ScaffoldState>(); // untuk menampilkan snackbar kita membutuhkan deklarasi global key

  void methodSnackbar(){
    skey.currentState.showSnackBar(new SnackBar(content: new Text("This is snackbar"),));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Snackbar"),
      ),
      key: skey,
      body: new Center(
        child: new RaisedButton(
          onPressed: (){
            methodSnackbar();
          },
          child: new Text("Snackbar"),
        ),
      ),
    );
  }
}

