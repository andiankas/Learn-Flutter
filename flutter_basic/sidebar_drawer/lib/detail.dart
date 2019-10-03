import 'package:flutter/material.dart';

class Detail extends StatelessWidget {

  Detail({
    this.fullname,this.profilePict
  });

  final String fullname,profilePict;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Profil $fullname"),
        backgroundColor: Colors.blue[700],
      ),
      body: new Container(
        child: new Center(
          child: new Image(image: new NetworkImage(profilePict),)
        ),
      ),
    );
  }
}