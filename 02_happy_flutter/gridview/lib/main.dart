import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: application(),));

class application extends StatefulWidget {
  @override
  _applicationState createState() => _applicationState();
}

class _applicationState extends State<application> {

  List<int> itemgrid = new List();

  @override
  void initState() {
    for (var i = 0; i < 30; i++) {
      itemgrid.add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new GridView.builder(
        itemCount: itemgrid.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4
        ),
        itemBuilder: (BuildContext context, int index){
          return new Card(
            color: Colors.blue,
            child: new Padding(padding: const EdgeInsets.all(25.0),),
          );
        },
      ),
    );
  }
}
