import 'package:flutter/material.dart';


class Order extends StatefulWidget {
  Order({Key key}) : super(key: key);

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Order"),
    );
  }
}