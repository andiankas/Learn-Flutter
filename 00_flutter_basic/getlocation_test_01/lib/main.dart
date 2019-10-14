import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:async/async.dart';
import 'dart:async';


void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  
void getLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
  }
  
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Location"),
        backgroundColor: Colors.blue
      ),
      body: 
      new Center(
        child: RaisedButton(
          child: Text("Get Location"),
          onPressed: getLocation,
        ),  
      )
      
    );
  }
}