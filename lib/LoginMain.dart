import 'package:flutter/material.dart';
import 'auth.dart';

class LoginMain extends StatefulWidget {
  LoginMain({this.auth});
  final BaseAuth auth;
  @override
  LoginMainState createState() => LoginMainState();
}

enum FormType {
  login,
  register
}

class LoginMainState extends State<LoginMain> {
  final formkey = new GlobalKey<FormState>();
  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      print('Form is Valid, Email : $_email, Password: $_password');
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          String userId = await widget.auth.signInWithEmailAndPassword(_email, _password);
          print('Signed In: {$userId}');
        } else {
          String userId = await widget.auth.createUserWithEmailAndPassword(_email, _password);
          print('Registered User: {$userId}');
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToRegister() {
    formkey.currentState.reset();
    setState(() {
      _formType =FormType.register;
    });
  }

  void moveToLogin() {
    formkey.currentState.reset();
    setState(() {
      _formType =FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Sign In'),
        ),
        body: new Container(
          padding: EdgeInsets.all(16.0),
          child: new Form(
            key: formkey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: 
                buildinput() + buildSubmit(),
            ),
          ),
        ));
  }

  List<Widget> buildinput() {
    if (_formType ==FormType.login) {
      return [
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
      Container(
        padding: EdgeInsets.only(top: 8.0),
        child: new TextFormField(
          decoration: new InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
          validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
          onSaved: (value) => _password = value,
          obscureText: true,
        ),
      ),
    ];
    } else {
        return [
          new TextFormField(
        decoration: new InputDecoration(labelText: 'Name', border: OutlineInputBorder()),
        validator: (value) => value.isEmpty ? 'Name can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
      Container(
        padding: EdgeInsets.only(top: 8.0),
        child: new TextFormField(
          decoration: new InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
          validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
          onSaved: (value) => _email = value,
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: 8.0),
        child: new TextFormField(
          decoration: new InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
          validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
          onSaved: (value) => _password = value,
          obscureText: true,
        ),
      ),
        ];
    }
    
  }

  List<Widget> buildSubmit() {
    
      if (_formType == FormType.login) {
        return [
        new Container(
          height: 60.0,
        padding: EdgeInsets.only(top: 16.0),
        child: new RaisedButton(
          child: new Text('Login'),
          onPressed: validateAndSubmit,
        ),
      ),
      new Center(
        child: Container(
          child: new FlatButton(
            child: new Text('or Create an account'),
            onPressed: moveToRegister,
          ),
        ),
      )
        ];
      } else {
        return [
        new Container(
          height: 60.0,
        padding: EdgeInsets.only(top: 16.0),
        child: new RaisedButton(
          child: new Text('Register'),
          onPressed: validateAndSubmit,
        ),
      ),
      new Center(
        child: Container(
          child: new FlatButton(
            child: new Text('already have an account? Login'),
            onPressed: moveToLogin,
          ),
        ),
      )
        ];
      }
      
    
  }

}
