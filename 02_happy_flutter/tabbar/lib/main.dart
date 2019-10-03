import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: new MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

  TabController tabController;

  @override
  void initState() {
    tabController = new TabController(length: 4,vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("TabBar App"),
        bottom: new TabBar(
          controller:  tabController,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home)),
            new Tab(icon: new Icon(Icons.dashboard)),
            new Tab(icon: new Icon(Icons.data_usage)),
            new Tab(icon: new Icon(Icons.close)),
          ],
        ),
      ),
      body: new TabBarView(
        controller: tabController,
        children: <Widget>[
          new Center(
            child: new Text("Welcome to HOME"),
          ),
          new Center(
            child: new Text("Welcome to DASHBOARD"),
          ),
          new Center(
            child: new Text("Welcome to DATA USAGE"),
          ),
          new Center(
            child: new Text("Welcome to CLOSE"),
          ),
        ],
      ),
    );
  }
}
