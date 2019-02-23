import 'package:flutter/material.dart';

class LoginMain extends StatefulWidget {
  @override
  LoginMainState createState() => LoginMainState();
}

class LoginMainState extends State<LoginMain> {

  String _email;
  String _pass;

  void validateAndSave() {

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Login'),
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Email'),
              ),
              new TextFormField(
                decoration:  new InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              new Container(
                padding: EdgeInsets.only(top: 16.0),
                child: new RaisedButton(
                  child: new Text('Login', style: TextStyle(fontSize: 18.0),),
                  onPressed: validateAndSave,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}