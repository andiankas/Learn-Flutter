import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      height: 1000.0,
      margin: EdgeInsets.only(
        top: 100.0,
        right: 10.0,
        left: 10.0,
      ),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Icon(
                Icons.person,
                size: 200.0,
                color: Colors.blue,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
              ),
              emailField(bloc),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
              ),
              passwordField(bloc),
              Container(
                margin: EdgeInsets.only(top: 25.0),
              ),
              submitButton(bloc),
            ],
          ),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'daput@udacoding.com',
                labelText: 'Email Address',
                errorText: snapshot.error,
                border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10.0))),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            obscureText: true,
            onChanged: bloc.changePassword,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                errorText: snapshot.error,
                border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10.0))),
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Login'),
          color: Colors.blue,
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }
}
