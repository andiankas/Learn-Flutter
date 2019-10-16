import 'package:flutter/material.dart';

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
          color: Colors.white
        ),
        backgroundColor: Colors.black,
        onPressed: (){},
      ),
       appBar: AppBar(
         leading: Container(
           padding: EdgeInsets.all(10),
           child: Image.asset("img/logo.jpg"),
         ),
         title: Text("Simple Note", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300,),),
         backgroundColor: Colors.black,
       ),
       backgroundColor: Colors.grey[300],
       body: Container(),
    );
  }
}