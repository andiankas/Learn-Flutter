import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Drawer"),
        backgroundColor: Colors.blue[800],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text("Andi Rustianto"),
              accountEmail: Text("andirus@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.black26,
                child: new Text("P"),
              ),
              decoration: new BoxDecoration(
                color: Colors.lightBlue
              ),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                  backgroundColor: Colors.black26,
                  child: new Text("Y"),
                ),
                new CircleAvatar(
                  backgroundColor: Colors.black26,
                  child: new Text("W"),
                ),
              ],
            ),
            new ListTile(
              title: new Text("Home Page"),
              trailing: new Icon(Icons.home),
            ),
            new ListTile(
              title: new Text("List Laptop"),
              trailing: new Icon(Icons.laptop),
            ),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
