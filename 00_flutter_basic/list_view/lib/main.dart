import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Listview",
    home: new Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue[400],
        title: new Text("List View"),
      ),
      body: new ListView(
        children: <Widget>[
          new ListFramework(imgLink: "http://www.regenapps.com/img/assets/icons/flutter-logo-round.png", title: "Flutter"),
          new ListFramework(imgLink: "https://agostini.tech/wp-content/uploads/2017/06/developer-coding-programming-firebase-google-icon.png", title: "Firebase"),
          new ListFramework(imgLink: "https://i.pinimg.com/originals/84/b1/06/84b1065e798f61aa80b8670a4b6fbb4d.png", title: "React Native"),
          new ListFramework(imgLink: "https://cdn3.iconfinder.com/data/icons/popular-services-brands/512/laravel-512.png", title: "Laravel"),
          new ListFramework(imgLink: "https://cdn3.iconfinder.com/data/icons/popular-services-brands/512/node-512.png", title: "Node JS"),
          new ListFramework(imgLink: "https://errorcodespro.com/wp-content/uploads/2019/02/python-logo.png", title: "Python"),
          new ListFramework(imgLink: "https://cdn6.aptoide.com/imgs/f/5/9/f59926a1446bf7c2a8563de5ebd3cdad_icon.png?w=240", title: "Codeigniter"),
        ],
      ),
    );
  }
}

class ListFramework extends StatelessWidget {

  ListFramework({this.imgLink,this.title});
  
  final String imgLink,title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Center(
        child: new Row(
          children: <Widget>[
            new Image(
              image: new NetworkImage(imgLink),
              width: 100.0
            ),
            new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Center(
                child: new Column(
                  children: <Widget>[
                    new Text(title,style: new TextStyle(fontSize: 30.0)),
                    new Text("Deskripsi",style: new TextStyle(fontSize: 18.0))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
