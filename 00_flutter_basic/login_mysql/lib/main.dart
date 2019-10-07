import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Login with PHP & MYSQL",
      home: new MyHomePage(),
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

  Future<List> _login() async {
    final response = await http.post("http://localhost/xdev/xlearn/flutter_login_mysql/login.php",
    body: {
      "username" : controllerUser.text,
      "password" : controllerPass.text,
    });

    print(response.body);
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

