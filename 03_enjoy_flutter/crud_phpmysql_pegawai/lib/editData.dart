import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'detail.dart';
import 'package:crud_phpmysql_pegawai/editData.dart';

class EditData extends StatefulWidget {
  
  final List list;
  final int index;

  EditData({this.list,this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController namaEditController;
  TextEditingController posisiEditController;
  TextEditingController gajiEditController;

  void editData(){
    var url = "http://192.168.43.35/xdev/xlearn/flutter_pegawai/editData.php";
    http.post(url,body:{
      "id" : widget.list[widget.index]['id'],
      "namaPegawai" : namaEditController.text,
      "posisiPegawai" : posisiEditController.text,
      "gajiPegawai" : gajiEditController.text,
      
    });
    print(widget.list[widget.index]['id']);
  }

  @override
  void initState() {
    namaEditController = new TextEditingController(text: widget.list[widget.index]['nama']);
    posisiEditController = new TextEditingController(text: widget.list[widget.index]['posisi']);
    gajiEditController = new TextEditingController(text: widget.list[widget.index]['gaji']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Edit Data"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                Padding(padding: const EdgeInsets.only(top: 15.0),),
                TextField(
                  controller: namaEditController,
                  decoration: InputDecoration(
                    hintText: "Input nama pegawai",
                    labelText: "Nama Pegawai",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.all(5.0),),
                TextField(
                  controller: posisiEditController,
                  decoration: InputDecoration(
                    hintText: "Input posisi pegawai",
                    labelText: "Posisi Pegawai",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.all(5.0),),
                TextField(
                  controller: gajiEditController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Input gaji pegawai",
                    labelText: "Gaji Pegawai",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.all(5.0),),
                new RaisedButton(
                  child: new Text("Update Data", style: TextStyle(color: Colors.white),),
                  color: Colors.blue,
                  onPressed: (){
                    print("edit");
                    editData(); // editData
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