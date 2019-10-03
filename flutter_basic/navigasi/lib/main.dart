import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new HalSatu(),
    title: "Navigasi",
    routes: <String, WidgetBuilder>{ //routes for navigation
      '/HalSatu'  : (BuildContext context) => new HalSatu(),
      '/HalDua'   : (BuildContext context) => new HalDua(),
    },
  ));
}

class HalSatu extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Music")),
      body: new Center(
        child: new IconButton(
          icon: new Icon(Icons.headset, size: 50.0),
          onPressed: (){
            Navigator.pushNamed(context, '/HalDua');
          },
        ),
      ),
    );
  }
}

class HalDua extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Speaker")),
      body: new Center(
        child: new IconButton(
          icon: new Icon(Icons.speaker, size: 50.0, color: Colors.orange[500]),
          onPressed: (){
            Navigator.pushNamed(context, '/HalSatu');
          },
        ),
      ),
    );
  }
}