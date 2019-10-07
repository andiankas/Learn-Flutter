import 'package:flutter/material.dart';
import 'package:imple_bloc_patern/Counter_bloc.dart';
import 'package:imple_bloc_patern/Content_provider.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  void dispose(){
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.getCount, //menghitung jumlah bloc
      initialData: CounterProvider().count, // menghitung jumlahcounterprovider
      builder: (context, snapshot) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You have pushed the button this many times",),
            Text("${snapshot.data}",style: Theme.of(context).textTheme.display1,), //menampilkan data counter
          ],
        ),
      ),
    );
  }
}