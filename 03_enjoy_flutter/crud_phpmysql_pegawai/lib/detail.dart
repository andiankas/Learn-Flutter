import 'package:flutter/material.dart';
import 'editData.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class Detail extends StatefulWidget {

  final List list;
  final int index;
  Detail({this.list,this.index});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  // function delete data
  void deleteData() {
    var url = "http://192.168.43.35/xdev/xlearn/flutter_pegawai/deleteData.php";
    http.post(url, body: {'id':widget.list[widget.index]['id']});
  }

  void _dismissDialog(context) {
    Navigator.pop(context);
  }

  void _pushToList(){
    Navigator.of(context).push(new MaterialPageRoute(
      builder: (BuildContext context) => new MyApp()
    ));
  }

  void confirm(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are you sure want to delete '${widget.list[widget.index]['nama']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("Yes, Delete!",style: TextStyle(color: Colors.black)),
          color: Colors.red,
          onPressed: (){
            print("deleted clicked");
            deleteData();
            _pushToList();
          },
        ),
        new RaisedButton(
          child: new Text("Cancel",style: TextStyle(color: Colors.black)),
          color: Colors.red,
          onPressed: () {
           _dismissDialog(context);
          },
        ),
      ],
    );
    showDialog(context: context,child: alertDialog);
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("${widget.list[widget.index]['posisi']}"),
        backgroundColor: Colors.blue[700],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(10.0),
            height: 500.0,
            child: Row(
              children: <Widget>[
                new Expanded(
                  child: Card(
                    child: new Column(
                      children: <Widget>[
                        new Padding(padding: const EdgeInsets.only(top: 30.0),),
                        new Text(widget.list[widget.index]['nama'], style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                        new Text("Posisi : ${widget.list[widget.index]['posisi']}",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                        new Text("Gaji : ${widget.list[widget.index]['gaji']}",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                        new Padding(padding: const EdgeInsets.only(top: 30.0),),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new RaisedButton(
                              child: new Text("Edit"),
                              color: Colors.blue,
                              onPressed: () => Navigator.of(context).push(
                                new MaterialPageRoute(
                                  builder: (BuildContext context)=> new EditData(list: widget.list, index: widget.index)
                                )
                              ),
                            ),
                            new Padding(padding: const EdgeInsets.all(5.0),),
                            new RaisedButton(
                              child: new Text("Delete"),
                              color: Colors.blue,
                              onPressed: () => confirm(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}