import 'package:crud_phpmysql_pegawai/floatingActionButton.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'detail.dart';

import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // membuat sebuah method yang digunakan untuk mengambil data dari server

  Future<List> getData() async{
    final response = await http.get("http://192.168.1.146/xdev/xlearn/flutter_pegawai/getPegawai.php");
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
        floatingActionButton: FloatingButton(),
        body: new FutureBuilder<List>(
          future: getData(), // memanggil method getData
          builder: (context, snapshot){
            if(snapshot.hasError) print(snapshot.error); // cek apakah snapshot error
            return snapshot.hasData 
              ? new ItemList(
                list: snapshot.data, // ketika snapshot memiliki data, maka akan dimasukkan ke dalam list
              ) :
              new Center(
                child: new CircularProgressIndicator(), // widget loading
              );
          },
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {

  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i){
        return new Container(
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => new Detail(
                  list: list,
                  index: i
                )
              )
            ),
            child: new Card(
              color: Colors.white,
              child: new ListTile(
                title: new Text(list[i]['nama']), // menampilkan data nama
                leading: new Icon(Icons.list), // menampilkan icon list
                subtitle: new Text("Posisi : ${list[i]['posisi']}"), // menampilkan posisi listnya
              ),
            ),
          ),
        );
      },
    );
  }
}