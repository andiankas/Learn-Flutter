import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Input text, Alert & Snackbar",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String teks = "";
  TextEditingController controllerInput = new TextEditingController();
  TextEditingController controllerAlert = new TextEditingController();
  TextEditingController controllerSB = new TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();

  void _snackbar(String str){
    if(str.isEmpty) return;
    _scaffoldState.currentState.showSnackBar(new SnackBar(
      content: new Text(str, style: new TextStyle(fontSize: 20.0, )),
    ));
  }

  void _alertdialog(String str){
    if(str.isEmpty) return;
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(str, style: new TextStyle(fontSize: 20.0)),
      actions: <Widget>[
        new RaisedButton(
          color: Colors.purple,
          child: new Text("Ok", style: new TextStyle(color: Colors.white),),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ],
    );
    
    // showing dialog
    showDialog(context: context,child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: 
        new AppBar(title: new Text("Input Text, Alert Dialog & Snackbar"),
        backgroundColor: Colors.purple  
      ),
      body:
      new Container(
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: controllerInput,
              decoration: new InputDecoration(
                hintText: "Tulis disini",
              ),
              // onChanged: (String str){
              //   setState(() {
              //     teks = str; 
              //   });
              // }, //onChanged
               onSubmitted: (String str){
                setState(() {
                  teks = str + "\n" + teks ;
                  controllerInput.text = "";
                });
              }, //onSubmitted
            ),
          

            new TextField(
              controller: controllerAlert,
              decoration: new InputDecoration(
                hintText: "Tulis untuk alert",
              ),
              onSubmitted: (String str){
                // alert dialog
                _alertdialog(str);
                controllerAlert.text = "";
              }, //onSubmitted
            ),

            new TextField(
              controller: controllerSB,
              decoration: new InputDecoration(
                hintText: "Tulis untuk snackbar",
              ),
              onSubmitted: (String str){
                // alert dialog
                _snackbar(str);
                controllerSB.text = "";
              }, //onSubmitted
            ),
            // result
            new Text(teks, style: new TextStyle(fontSize: 20.0)),
          ],
        ),
      ),
    );
  }
}

