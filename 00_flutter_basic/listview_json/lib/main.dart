import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(new MaterialApp(
    title: "ListView",
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List dataJSON;
  Future<String> ambilData() async {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://al-quran-8d642.firebaseio.com/data.json?print=pretty"),
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
            // margin: new EdgeInsets.only(top: 10.0),
            child: new Card(
              child: new Container(
                padding: new EdgeInsets.all(10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(dataJSON[i]['nama'],style: new TextStyle(fontSize: 20.0, color: Colors.black)),
                    new Text(dataJSON[i]['arti'],style: new TextStyle(fontSize: 17.0, color: Colors.black54)),
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
