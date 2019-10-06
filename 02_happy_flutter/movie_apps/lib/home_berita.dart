import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'detail_berita.dart';
import 'package:http/http.dart' as http;

class DataBeritaHome extends StatefulWidget {
  @override
  _DataBeritaHomeState createState() => _DataBeritaHomeState();
}

class _DataBeritaHomeState extends State<DataBeritaHome> {

  Future<List> getData() async{
    final responseData = await http.get("http://192.168.43.35/xdev/xlearn/flutter_news/get_berita.php");
    return json.decode(responseData.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Movie Catalog"),
        backgroundColor: Colors.green,
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context,snapshot){
          if (snapshot.hasError)print(snapshot.error);
          return snapshot.hasData ? new ItemList(list: snapshot.data) : new Center(
            child: CircularProgressIndicator(),
          );
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
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i){
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: (){
              Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> DetailPageBerita(list: list, index:i)));
            },
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]["judul_berita"],style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                subtitle: new Text("Tanggal : ${list[i]['tanggal_berita']}"),
                trailing: new Image.network("http://192.168.43.35/xdev/xlearn/flutter_news/gambar/"+list[i]["gbr_berita"],fit: BoxFit.cover,height: 60.0,width: 60.0,),
              ),
            ),
          ),
        );
      },
    );
  }
}