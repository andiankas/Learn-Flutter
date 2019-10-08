import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(title: "My Store",home: new Home(),));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  Future<List> getData() async{
    final response = await http.get("http://192.168.1.146/xdev/xlearn/flutter_mystore/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Store"),
      ),body: new FutureBuilder<List>(
        future: getData(),
        builder: (context,snapshot){
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData ? new ItemList(list: snapshot.data) : new Center(child: new CircularProgressIndicator(),);
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {

  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context,i){
        return new Text(list[i]["item_name"]);
      },
    );
  }
}