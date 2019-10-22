import 'package:flutter/material.dart';


class Inbox extends StatefulWidget {
  Inbox({Key key}) : super(key: key);

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Inbox"),
    );
  }
}