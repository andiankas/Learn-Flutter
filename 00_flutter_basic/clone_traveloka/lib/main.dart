import 'package:clone_traveloka/pages/account.dart';
import 'package:clone_traveloka/pages/bookmark.dart';
import 'package:clone_traveloka/pages/home.dart';
import 'package:clone_traveloka/pages/inbox.dart';
import 'package:clone_traveloka/pages/order.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clone Traveloka",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(
        title: "Traveloka"
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;

  final _layoutPage = [
    Home(),
    Bookmark(),
    Order(),
    Inbox(),
    Account(),
  ];

  void _onTabItem(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _layoutPage.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTabItem,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Bookmark"),
            icon: Icon(Icons.bookmark),
          ),
          BottomNavigationBarItem(
            title: Text("Order"),
            icon: Icon(Icons.view_agenda),
          ),
          BottomNavigationBarItem(
            title: Text("Inbox"),
            icon: Icon(Icons.message),
          ),
          BottomNavigationBarItem(
            title: Text("Account"),
            icon: Icon(Icons.account_box),
          ),
        ],
      ),
    );
  }
}
