import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Traveloka"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: (){},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Profile(),
          Divider(), // Divider like hr on html - membuat garis pembatas
        ],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("images/avatar_nopict.png")
            ),
          ),
        ),
        title : Text("John Doe Ferguso", style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Row(
          children: <Widget>[
            RaisedButton.icon(
              icon: Icon(Icons.album),
              label: Text("0 poin"),
              color: Colors.grey[200],
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              onPressed: (){},
            ),
            Padding(padding: EdgeInsets.all(8)),
            RaisedButton(
              child: Text("Traveloka Pay"),
              color: Colors.grey[200],
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}