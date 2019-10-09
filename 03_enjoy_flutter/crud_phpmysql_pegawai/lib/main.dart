import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'detail.dart';
import 'addData.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // membuat sebuah method yang digunakan untuk mengambil data dari server

  Future<List> getData() async{
    final response = await http.get("http://localhost/xdev/xlearn/flutter_pegawai/getPegawai.php");
    return json.decode(response.body); // data yang diambil dari server kemudian di decode
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          title: Text("Data Pegawai"),
          backgroundColor: Colors.blue[700],
        ),
        floatingActionButton: new FloatingActionButton(
          backgroundColor: Colors.blue[700],
          child: new Icon(
            Icons.add,
            color: Colors.white
          ),
          onPressed: (){},
        ),
      ),
    );
  }
}