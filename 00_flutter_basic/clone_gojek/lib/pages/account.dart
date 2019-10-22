import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  Account({Key key}) : super(key: key);

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Center(
       child: Container(
         child: Text("Account"),
       ),
    );
  }
}