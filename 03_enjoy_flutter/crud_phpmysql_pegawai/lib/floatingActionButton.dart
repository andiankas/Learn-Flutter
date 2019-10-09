import 'package:flutter/material.dart';
import 'addData.dart';

class FloatingButton extends StatefulWidget {
  @override
  _FloatingButtonState createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      new FloatingActionButton(
        backgroundColor: Colors.blue[700],
        child: new Icon(
          Icons.add,
          color: Colors.white
        ),
        onPressed: () {
          print("Clicked");
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new AddData()),
          );
        },
      ),
    );
  }
}