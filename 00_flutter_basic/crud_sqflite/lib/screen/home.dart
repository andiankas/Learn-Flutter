import 'package:flutter/material.dart';

import 'note_page.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.blue[900]
        ),
        backgroundColor: Colors.blue,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => NotePage(null,true))
        ),
      ),
       appBar: AppBar(
         leading: Container(
           padding: EdgeInsets.all(10),
           child: Image.asset("img/logo-book.png"),
         ),
         title: Text("Simple Note", style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w800,),),
         backgroundColor: Colors.blue,
       ),
       backgroundColor: Colors.grey[300],
       body: Column(
         
       ),
    );
  }
}

