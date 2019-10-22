import 'package:clone_gojek/screen/account.dart';
import 'package:clone_gojek/screen/chat.dart';
import 'package:clone_gojek/screen/home.dart';
import 'package:clone_gojek/screen/inbox.dart';
import 'package:clone_gojek/screen/order.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gojek',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: RoutesNavigation(),
    );
  }
}

class RoutesNavigation extends StatefulWidget {
  RoutesNavigation({Key key}) : super(key: key);

  @override
  _RoutesNavigationState createState() => _RoutesNavigationState();
}

class _RoutesNavigationState extends State<RoutesNavigation> {

  int _selectedIndex = 0;
  final List<Widget> pages = [
    Home(),
    Order(),
    Chat(),
    Inbox(),
    Account()
  ];

  void _onTabItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Container(
          child: Image.asset("img/logo.png"),
          height: 25,
        ),
        actions: <Widget>[
          Image.asset("img/diskon.png", scale: 3,),
        ],
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: false,
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTabItem,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset("img/home.png", scale: 2.5,),
            ),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset("img/orders.png", scale: 2.5,),
            ),
            title: Text("Order"),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset("img/chat.png", scale: 2.5,),
            ),
            title: Text("Chat"),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset("img/inbox.png", scale: 2.5,),
            ),
            title: Text("Inbox"),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset("img/account.png", scale: 2.5,),
            ),
            title: Text("Account"),
          ),
        ]
      ),
    );
  }
}
