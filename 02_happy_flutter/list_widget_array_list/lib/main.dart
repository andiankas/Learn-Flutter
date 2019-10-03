import 'package:flutter/material.dart';

void main() {
  runApp(application());
}

class application extends StatefulWidget {
  @override
  _applicationState createState() => _applicationState();
}

class _applicationState extends State<application> {

  List<int> item = new List();

  @override
  void initState() {
    for(int i=0;i<25;i++){
      item.add(i);
    }
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Dummy Aplikasi",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("List Array Widget"),
        ),
        body: new ListView.builder(itemCount: item.length,itemBuilder: (BuildContext context,int index){
          return new ListTile(
            title: new Text("item nomor : $index"),
            trailing: new Icon(Icons.print),
          );
        }),
      ),
    );
  }
}