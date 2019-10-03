import 'package:flutter/material.dart';
import './detail.dart';

void main() {
  runApp(new MaterialApp(
    title: "Sidebar",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String profilePict01 = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2OB2nDkmMF_TKeF-lUW8yC11c7yT4tUumBwQko9lMX_vRkMOP";
  String profilePict02 = "https://i.pinimg.com/originals/fe/5f/0f/fe5f0f31c0a547646b61d97ae6105162.jpg";
  String backupProfilePict;

  String user01 = "Tom Holland";
  String user02 = "Kendal Jenner";
  String backupUser;

  String emailUser01 = "tomholland@gmail.com";
  String emailUser02 = "kendaljenner@gmail.com";
  String backupEmail;

  void changeUser(){
    this.setState((){

      backupProfilePict  = profilePict01;
      profilePict01      = profilePict02;
      profilePict02      = backupProfilePict;

      backupUser         = user01;
      user01             = user02;
      user02             = backupUser;

      backupEmail        = emailUser01;
      emailUser01       = emailUser02;
      emailUser02       = backupEmail;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Demo Sidebar - Drawer"),
        backgroundColor: Colors.blue[700],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(user01),
              accountEmail: new Text(emailUser01),
              currentAccountPicture: new GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Detail(fullname: user01, profilePict: profilePict01)
                  ));
                },
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(profilePict01),
                ),
              ),
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new NetworkImage("https://livewallpaperhd.com/wp-content/uploads/2017/05/Deep-Blue-Sea-Wallpaper-Desktop-700x394.jpg"),
                fit: BoxFit.cover)
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  child: new CircleAvatar(backgroundImage: new NetworkImage(profilePict02)),
                  onTap: ()=> changeUser(), //ganti user jika di tap
                )
                
              ],
            ),
            new ListTile(
              title: new Text("Setting"),
              trailing: new Icon(Icons.settings),
            ),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
            ),
          ],
        ),
      ),
      body: new Container(

      ),
    );
  }
}