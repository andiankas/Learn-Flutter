import 'package:flutter/material.dart';


class Bookmark extends StatefulWidget {
  Bookmark({Key key}) : super(key: key);

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Bookmark"),
    );
  }
}