import 'package:flutter/material.dart';
import 'package:mvp/model/model.dart';
import 'package:mvp/presenter/presenter.dart';
import 'package:mvp/view/view.dart';

class MyHomePage extends StatefulWidget {

  final String title;
  final AppPresenter presenter;

  MyHomePage(this.presenter,{this.title, Key key}): super(key:key);

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements AppView{

  AppModel _appModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text(widget.title),
       ),
       body: Column(
         children: <Widget>[
           TextField(
             controller: _appModel.controller1,
           ),
           TextField(
             controller: _appModel.controller2,
           ),
           RaisedButton(
             onPressed: () => this.widget.presenter.buttonClick(),
             child: Icon(Icons.add),
           ),
           Text("Result : ${_appModel.result}", style: TextStyle(fontSize: 20),)
         ],
       ),
    );
  }

  @override
  void refreshData(AppModel model) {
    setState(() {
      this._appModel = model;
    });
  }

  @override
  void initState() {
    super.initState();
    this.widget.presenter.view = this;
  }
}