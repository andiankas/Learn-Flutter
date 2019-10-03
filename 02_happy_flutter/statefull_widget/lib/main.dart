import 'package:flutter/material.dart';

void main() {
  runApp(new statefullwidget());
}

class statefullwidget extends StatefulWidget {
  @override
  _statefullwidgetState createState() => _statefullwidgetState();
}

class _statefullwidgetState extends State<statefullwidget> {

  String txt = ""; //inisiasi string txt

  @override
  void initState() {
    txt = "Klik tombol ini";
    super.initState();
  }

  void method1(){
    setState(() {
      // declare string seletah button di click
      txt = "Text is changed";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Statefull Widget",
      home: new Scaffold(
        body: new Center(
          child: new RaisedButton(
            onPressed: (){
              method1();
            },
            child: new Text(txt),
          ),
        ),
      ),
    );
  }
}