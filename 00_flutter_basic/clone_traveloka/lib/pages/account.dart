import 'package:flutter/material.dart';


class Account extends StatefulWidget {
  Account({Key key}) : super(key: key);

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Account"),
    );
  }
}