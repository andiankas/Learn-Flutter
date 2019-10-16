import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(
    MaterialApp(
      title: "Login SharedPreferenece",
      home: Login(),
    ),
  );
}

class Login extends StatefulWidget {
  
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String username,password;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide(){
    setState(() {
      _secureText = !_secureText;
    });
  }

  // check or validation form login
  check(){
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      print("username : $username, password : $password");  
      login();  
    }
  }

  login() async {
    final response = await http.post("http://192.168.1.146/xdev/xlearn/flutter_login_sharedpreference/api/login.php", body: {
      "username" : username,
      "password" : password
    });
    final dataLogin = jsonDecode(response.body);
    print(dataLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Login Shared Preference"),
       ),
       body: Form(
         key: _key,
          child: ListView(
           padding: const EdgeInsets.all(20.0),
           children: <Widget>[
             TextFormField(
               validator: (e) {
                 if (e.isEmpty){
                   return "Please insert your username";
                 }
               },
               onSaved: (e)=>username = e,
               decoration: InputDecoration(
                 labelText: "Username"
               ),
             ),
             TextFormField(
               validator: (e) {
                 if (e.isEmpty){
                   return "Please insert your password";
                 }
               },
               onSaved: (e)=>password = e,
               obscureText: _secureText,
               decoration: InputDecoration(
                 labelText: "Password",
                 suffixIcon: IconButton(
                   onPressed: showHide,
                   icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility),
                 ),
               ),
             ),
             MaterialButton(
               child: Text("Login"),
               onPressed: (){
                 check();
                 print("login");
               },
             ),
           ],
         ),
       ),
    );
  }
}
