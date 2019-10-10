import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'dart:io';
import 'package:async/async.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  TextEditingController namaController = new TextEditingController();
  TextEditingController posisiController = new TextEditingController();
  TextEditingController gajiController = new TextEditingController();

  void addData(){
    var url = "http://192.168.43.35/xdev/xlearn/flutter_pegawai/addData.php";
    http.post(url,body: {
      "namaPegawai"   : namaController.text,
      "posisiPegawai" : posisiController.text,
      "gajiPegawai"   : gajiController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add data pegawai"),
        backgroundColor: Colors.blue[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.only(top: 15.0),),
                new TextField(
                  controller: namaController,
                  decoration: new InputDecoration(
                    hintText: "Input Nama Pegawai",
                    labelText: "Nama Pegawai",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    )
                  ),
                ),
                new Padding(padding: new EdgeInsets.all(5.0),),
                new TextField(
                  controller: posisiController,
                  decoration: new InputDecoration(
                    hintText: "Input Posisi Pegawai",
                    labelText: "Posisi Pegawai",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    )
                  ),
                ),
                new Padding(padding: new EdgeInsets.all(5.0),),
                new TextField(
                  controller: gajiController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    hintText: "Input Gaji Pegawai",
                    labelText: "Gaji Pegawai",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    )
                  ),
                ),
                new Padding(padding: new EdgeInsets.all(5.0),),
                new RaisedButton(
                  child: new Text("Add Data", style: TextStyle(color: Colors.white),),
                  color: Colors.blue,
                  onPressed: (){
                    addData(); // addData untuk upload image
                    Navigator.of(context).push(
                      new MaterialPageRoute(builder: (BuildContext context) => new MyApp()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}