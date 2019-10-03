import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new HalamanSatu(),
  ));
}

class HalamanSatu extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: 
      new Center(
        child:
        new Container(
          color: Colors.blue[500],
          width: 200.0,
          height: 100.0,
          child: new Center(
            child: new Icon(Icons.android, color: Colors.white, size: 50.0),
          ),
        ),
      )
      
    );
  }
}