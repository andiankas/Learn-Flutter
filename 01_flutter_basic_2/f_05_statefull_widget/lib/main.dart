import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int number = 1;

  void tambahData(){
    setState(() {
      number = number+1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Statefull Widget"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                number.toString(), // mengubah number int menjadi string
                style: TextStyle(fontSize: 20 * number.toDouble()), // menambahkan ukuran text
              ),
              RaisedButton(
                child: Text("Tambah"),
                onPressed: tambahData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}