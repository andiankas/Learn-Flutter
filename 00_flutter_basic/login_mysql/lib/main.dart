import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_mysql/adminPage.dart';

import 'memberPage.dart';

void main() => runApp(new MyApp());
String username = "";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login with PHP & MYSQL",
      home: new MyHomePage(),
      routes: <String,WidgetBuilder>{
        '/adminPage': (BuildContext context) => new AdminPage(username: username,),
        '/memberPage': (BuildContext context) => new MemberPage(username: username,),
        '/MyHomePage': (BuildContext context) => new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();

  String msg='';

  Future<List> _login() async {
    final response = await http.post("http://192.168.1.146/xdev/xlearn/flutter_login_mysql/login.php",
    body: {
      "username" : controllerUser.text,
      "password" : controllerPass.text,
    });

    print(response.body);

    var datauser = json.decode(response.body);
    if (datauser.length==0) {
      setState(() {
        msg = "Login Failed";
      });
    }else{
      if (datauser[0]['level'] == "admin") {
        print("Welcome Admin");
        Navigator.pushReplacementNamed(context, '/adminPage');
      }else if (datauser[0]['level'] == "member") {
        print("Welcome Member");
        Navigator.pushReplacementNamed(context, '/memberPage');
      }

      setState(() {
        username = datauser[0]['username'];
      });
    }

    return datauser;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Login"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Username", style: TextStyle(fontSize: 18.0)),
              new TextField(
                controller: controllerUser,
                decoration: InputDecoration(hintText: "Username"),
              ),
              new Text("Password", style: TextStyle(fontSize: 18.0)),
              new TextField(
                controller: controllerPass,
                decoration: InputDecoration(hintText: "Password"),
              ),
              new RaisedButton(
                child: Text("Login"),
                onPressed: (){
                  _login();
                },
              ),
              Text(msg,style: TextStyle(fontSize: 20,color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}

