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
    final response = await http.post("http://192.168.43.35/xdev/xlearn/flutter_login_sharedpreference/api/login.php", body: {
      "username" : username,
      "password" : password
    });
    final dataLogin = jsonDecode(response.body);
    int value = dataLogin['value'];
    String message = dataLogin['message'];
    String usernameAPI = dataLogin['username'];
    String namaAPI = dataLogin['nama'];
    String levelAPI = dataLogin['level'];
    String statusAPI = dataLogin['status'];
    if (value==200) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value, namaAPI, usernameAPI);
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
  savePref(int value, String nama, String username) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("nama", nama);
      preferences.setString("username", username);
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

  // signout
  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
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
                Padding(padding: const EdgeInsets.all(20)),
                InkWell(
                  child: Text("Create a new account", textAlign: TextAlign.center,),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Register()
                    ));
                  },
                ),
              ],
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        return MainMenu(signOut);
        break;
    }
    
  }
}

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String password,username,nama;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  // show hide password
  showHide(){
    setState(() {
      _secureText = !_secureText;
    });
  }

  // check
  check(){
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      signup();
    }
  }

  signup() async {
    final response = await http.post("http://192.168.43.35/xdev/xlearn/flutter_login_sharedpreference/api/register.php", body: {
      "nama" : nama,
      "username" : username,
      "password" : password
    });
    final dataRegister = jsonDecode(response.body);
    int value = dataRegister['value'];
    String message = dataRegister['message'];
    if (value==200) {
      setState(() {
        Navigator.pop(context);
      });
    } else {
      print(message);
    }
  }
          
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: Form(
        key: _key,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              validator: (e) {
                if (e.isEmpty){
                  return "Please insert your full name";
                }
              },
              onSaved: (e)=>nama = e,
              decoration: InputDecoration(
                labelText: "Fullname"
              ),
            ),
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
              child: Text("Register"),
              onPressed: (){
                check();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MainMenu extends StatefulWidget {
  
  final VoidCallback signOut;
  MainMenu(this.signOut);
  // MainMenu({Key key}) : super(key: key);
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

  signOut(){
    setState(() {
      widget.signOut();
    });
  }

  String username = "", nama = "";
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("username");
      nama = preferences.getString("nama");
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              signOut();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Center(
        child: Text("Halo $nama, ($username)"),
      ),
    );
  }
}