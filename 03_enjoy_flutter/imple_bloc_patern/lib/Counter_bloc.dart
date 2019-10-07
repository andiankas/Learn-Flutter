import 'dart:async';
import 'package:imple_bloc_patern/Content_provider.dart';

class CounterBloc{
  final counterController = StreamController(); // membuat stream controller
  final CounterProvider provider = CounterProvider(); // membuat counterProvider
  Stream get getCount => counterController.stream;

  void updateCount(){
    provider.increaseCount();
    counterController.sink.add(provider.count); // menambahkan provider ke dalam counterController
  }

  void dispose(){
    counterController.close(); // menutup counterController ketika tidak digunakan
  }
}

final bloc = CounterBloc(); // menjadikan class CounterBloc sebagai sebuah object agar dapat digunakan pada class lain