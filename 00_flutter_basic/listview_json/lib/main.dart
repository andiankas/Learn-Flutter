import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(new MaterialApp(
    title: "ListView",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List dataJSON;
  Future<String> ambilData() async {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      dataJSON = json.decode(hasil.body);
    });
  }

  @override
  void initState() {
    this.ambilData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("List Data JSON")),
      body: new ListView.builder(
        itemCount: dataJSON == null ? 0 : dataJSON.length,
        itemBuilder: (context, i) {
          return new Container(
            padding: new EdgeInsets.all(20.0),
            child: new Card(
              child: new Container(
                padding: new EdgeInsets.all(20.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(dataJSON[i]['title'],style: new TextStyle(fontSize: 20.0, color: Colors.black)),
                    new Text(dataJSON[i]['body'],style: new TextStyle(fontSize: 17.0, color: Colors.black54)),
                  ],
                )
              )
            ),
          );
        },
      ),
    );
  }
}
