import 'package:flutter/material.dart';

class Komputer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Text("Komputer", style: new TextStyle(fontSize: 30.0)),
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Image(image: new NetworkImage("https://www.overclockers.co.uk/media/image/ocuk-2017-pcg-mid-all.png"),width: 400.0)
          ],
        ),
      )
    );
  }
}