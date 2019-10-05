import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Animasi Transisi",
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Animasi Transisi"),
        backgroundColor: Colors.green[700],
      ),
      body: new Card(
        margin: EdgeInsets.all(20.0),
        child: GestureDetector(
          child: Hero(
            tag: "imageHero",
            child: Image.network("https://dkrn4sk0rn31v.cloudfront.net/2019/02/04115610/capa-flutter.png"),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_){
              return DetailScreen();
            }));
          },
        ),
      )
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: "imageHero",
            child: Image.network("https://dkrn4sk0rn31v.cloudfront.net/2019/02/04115610/capa-flutter.png"),
          ),
        ),
        onTap: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}

