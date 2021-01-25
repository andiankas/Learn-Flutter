import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flexibel Widget"),
        ),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(3),
                      color: Colors.black,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.all(3),
                      color: Colors.grey,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(3),
                      color: Colors.brown,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(3),
                color: Colors.red,
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                margin: EdgeInsets.all(3),
                color: Colors.blue,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(3),
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
