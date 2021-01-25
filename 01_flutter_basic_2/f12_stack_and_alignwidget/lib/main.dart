import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stack & Align Widget"),
        ),
        body: Stack(
          children: [
            // background
            Column(
              children: [
                Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        Flexible(
                            flex: 1, child: Container(color: Colors.white)),
                        Flexible(
                            flex: 1, child: Container(color: Colors.black12)),
                      ],
                    )),
                Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        Flexible(
                            flex: 1, child: Container(color: Colors.black12)),
                        Flexible(
                            flex: 1, child: Container(color: Colors.white)),
                      ],
                    )),
              ],
            ),
            // listview
            ListView(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                )
              ],
            ),
            // button
            Align(
              // alignment: Alignment.bottomCenter,
              alignment: Alignment(0.80,0.90),
                child: RaisedButton(
              onPressed: () {},
              child: Text("My Button"),
              color: Colors.amber,
            ))
          ],
        ),
      ),
    );
  }
}
