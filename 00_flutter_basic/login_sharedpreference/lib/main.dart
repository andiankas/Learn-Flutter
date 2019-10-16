import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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

enum LoginStatus{
  notSignIn,
  signIn
}

class _LoginState extends State<Login> {
  
  LoginStatus _loginStatus = LoginStatus.notSignIn;

  String username,password;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  // show hide password
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
    int value = dataLogin['value'];
    String message = dataLogin['message'];
    if (value==200) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value);
      });
      print(message);
    } else {
      setState(() {
        _loginStatus = LoginStatus.notSignIn;
      });
      print(message);
    }
    print(dataLogin);
  }

  // set sharedPreferences
  savePref(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.commit();
    });
  }

  // get sharedPreferences
  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
      _loginStatus = value == 200 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
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
        break;
      case LoginStatus.signIn:
        return MainMenu();
        break;
    }
    
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}