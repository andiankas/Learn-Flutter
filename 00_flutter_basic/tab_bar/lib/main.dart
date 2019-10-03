import 'package:flutter/material.dart';
import './hal_headset.dart' as headset;
import './hal_komputer.dart' as komputer;
import './hal_smartphone.dart' as smartphone;
import './hal_radio.dart' as radio;


void main() {
  runApp(new MaterialApp(
    title: "Tab Bar",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  TabController controller;
  @override
  void initState() {
    controller = new TabController(vsync: this,length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text("Daftar Elektronik"),
        bottom: new TabBar(
          indicatorColor: Colors.white,
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.computer),text: "Komputer"),
            new Tab(icon: new Icon(Icons.headset),text: "Headset"),
            new Tab(icon: new Icon(Icons.smartphone),text: "HP"),
            new Tab(icon: new Icon(Icons.radio),text: "Radio")
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new komputer.Komputer(),
          new headset.Headset(),
          new smartphone.Smartphone(),
          new radio.Radio(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.red,
        child: new TabBar(
          indicatorColor: Colors.white,
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.computer),text: "Komputer"),
            new Tab(icon: new Icon(Icons.headset),text: "Headset"),
            new Tab(icon: new Icon(Icons.smartphone),text: "HP"),
            new Tab(icon: new Icon(Icons.radio),text: "Radio")
          ],
        ),
      ),
    );
  }
}