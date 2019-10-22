import 'package:clone_gojek/pages/account.dart';
import 'package:clone_gojek/pages/chat.dart';
import 'package:clone_gojek/pages/home.dart';
import 'package:clone_gojek/pages/inbox.dart';
import 'package:clone_gojek/pages/order.dart';
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
            title: Text("Home"),
            activeIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset("img/home.png", scale: 2.5,),
            ),
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset("img/home-non.png", scale: 2.5,),
            ),
          ),
          BottomNavigationBarItem(
            title: Text("Order"),
            activeIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset("img/orders.png", scale: 2.5,),
            ),
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset("img/orders-non.png", scale: 2.5,),
            ),
          ),
          BottomNavigationBarItem(
            title: Text("Chat"),
            activeIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset("img/chat.png", scale: 2.5,),
            ),
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset("img/chat-non.png", scale: 2.5,),
            ),
          ),
          BottomNavigationBarItem(
            title: Text("Inbox"),
            activeIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset("img/inbox.png", scale: 2.5,),
            ),
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset("img/inbox-non.png", scale: 2.5,),
            ),
          ),
          BottomNavigationBarItem(
            title: Text("Account"),
            activeIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset("img/account.png", scale: 2.5,),
            ),
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset("img/account-non.png", scale: 2.5,),
            ),
          ),
        ]
      ),
    );
  }
}
