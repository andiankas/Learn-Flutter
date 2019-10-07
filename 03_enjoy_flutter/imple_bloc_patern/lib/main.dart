import 'package:flutter/material.dart';
import 'package:imple_bloc_patern/Counter.dart';
import 'package:imple_bloc_patern/Counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bloc Pattern",
      home: MyHomePage(
        title: "Bloc Pattern",
      ),
      debugShowCheckedModeBanner: false, // untuk menonaktifkan banner debug pada aplikasi
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage ({Key key,this.title}) : super(key:key); // bagian ini berfungsi untuk mengambil data title dari title pada widget home
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter(){
    bloc.updateCount(); // update data counter melalui bloc
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ), 
      body: Counter(), //bagian body kita langsung memanggil class counter
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter, // saat di klik tombol + maka memanggil method _incrementCounter
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),     
    );
  }
}