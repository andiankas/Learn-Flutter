import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    home: new MyApp(),
  )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String _jk = "";
  List<String> religion = ["Islam","Kristen","Katolik","Hindu","Budha","Konghucu"];
  String _religion = "Islam";

  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  TextEditingController controllerKet = new TextEditingController();

  void _pilihJk(String value){
    setState(() {
      _jk = value;
      print(_jk);
    });
  }

  void selectReligion(String value){
    setState(() {
      _religion = value;
    });
  }

  void sentData(){
    AlertDialog alertDialog = new AlertDialog(
      content:  new Container(
        height: 200.0,
        child: new Column(
          children: <Widget>[
            new Text("Nama  :   ${controllerName.text}"),
            new Text("Pass  :   ${controllerPass.text}"),
            new Text("Ket   :   ${controllerKet.text}"),
            new Text("Jeni Kelamin   :   $_jk"),
            new Text("Agama   :   $_religion"),
            new RaisedButton(
              child: new Text("Ok"),
              onPressed: ()=> Navigator.pop(context),
            ),
          ],
        ),
      )
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new Icon(Icons.list),
        title: new Text("Formulir"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(50.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerName,
                  decoration: new InputDecoration(
                    hintText: "Masukkan nama anda",
                    labelText: "Nama",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0)
                    )
                  ),
                ),
                new Padding(padding: new EdgeInsets.all(10.0),),
                new TextField(
                  controller: controllerPass,
                  obscureText: true, // for password
                  decoration: new InputDecoration(
                    hintText: "Masukkan password anda",
                    labelText: "Password",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0)
                    )
                  ),
                ),
                new Padding(padding: new EdgeInsets.all(10.0),),
                new TextField(
                  controller: controllerKet,
                  maxLines: 3,
                  decoration: new InputDecoration(
                    hintText: "Masukkan keterangan",
                    labelText: "Keterangan",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0)
                    )
                  ),
                ),
                new Padding(padding: new EdgeInsets.all(10.0),),
                new RadioListTile(
                  value: "Man",
                  title: new Text("Man"),
                  groupValue: _jk,
                  onChanged: (String value){
                    _pilihJk(value);
                  },
                  activeColor: Colors.teal,
                  subtitle: new Text("Pria"),
                ),
                new RadioListTile(
                  value: "Woman",
                  title: new Text("Woman"),
                  groupValue: _jk,
                  onChanged: (String value){
                    _pilihJk(value);
                  },
                  activeColor: Colors.teal,
                  subtitle: new Text("Wanita"),
                ),
                new Padding(padding: new EdgeInsets.all(10.0),),
                new Row(
                  children: <Widget>[
                    new Text("Agama    :     ",style: new TextStyle(fontSize: 15.0,color: Colors.black)),
                    new DropdownButton(
                      onChanged: (String value){
                        selectReligion(value);
                      },
                      value: _religion,
                      items: religion.map((String value){
                        return new DropdownMenuItem(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                new RaisedButton(
                  child: new Text("OK"),
                  color: Colors.red,
                  onPressed: (){
                    sentData();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
