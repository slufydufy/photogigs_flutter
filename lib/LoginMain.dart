import 'package:flutter/material.dart';
import 'auth.dart';
import 'HomeMain.dart';

class LoginMain extends StatefulWidget {
  LoginMain({this.auth, this.onSignIn});

  final BaseAuth auth;
  final VoidCallback onSignIn;

  @override
  LoginMainState createState() => LoginMainState();
}

enum FormMode{LOGIN, SIGNUP}

class LoginMainState extends State<LoginMain> {
  final _formKey = new GlobalKey<FormState>();

  bool _isIos;
  bool _isLoading;

  String _email;
  String _password;
  String _errorMessage;

  FormMode _formMode = FormMode.LOGIN;

bool _validateAndSave() {
  final form = _formKey.currentState;
  if (form.validate()) {
    form.save();
    return true;
  }
  return false;
}

void _validateAndSubmit() async {
  setState(() {
    _errorMessage = "";
    _isLoading = true;
  });
  if (_validateAndSave()) {
    String userId = "";
    try {
      if (_formMode == FormMode.LOGIN) {
        userId = await widget.auth.signIn(_email, _password);
        print('Signup User: $userId');
      } else {
        userId = await widget.auth.signUp(_email, _password);
        print('SignIn User: $userId');
      }
      setState(() {
        _isLoading = true;
      });
      if (userId.length > 0 && userId !=null && _formMode ==FormMode.LOGIN) {
        widget.onSignIn();
      }
      
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading =false;
        if (_isIos) {
          _errorMessage = e.details;
        } else {
          _errorMessage = e.message;
        }
      });
    }
  }
}

@override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

void _formSignUp() {
  _formKey.currentState.reset();
  _errorMessage = "";
  setState(() {
    _formMode = FormMode.SIGNUP;
  });
}

void _formLogin() {
  _formKey.currentState.reset();
  _errorMessage = "";
  setState(() {
    _formMode = FormMode.LOGIN;
  });
}



  @override
  Widget build(BuildContext context) {
    _isIos = Theme.of(context).platform == TargetPlatform.iOS;

    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Login'),
        ),
        body: Stack(
          children: <Widget>[
            _showBody(),
            _showCircular()
          ],
        )
        );
  }

  Widget _showCircular() {
    if (_isLoading) {
      return Center(
        child: new CircularProgressIndicator(),
      );
    }
    return Container();
  }

  Widget _showBody() {
    return new Container(
      child: new Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            // _showLogo(),
            _showForm(),
            _showButton(),
            _showTextButton(),
            _showError()
          ],
        ),
      ),
    );
  }

  // Widget _showLogo() {
  //   return new Hero(
  //     child: Padding(
  //       padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
  //       child: CircleAvatar(
  //         child: Icon(Icons.people),
  //       ),
  //     ),
  //   );
  // }

  Widget _showForm() {
    return new Column(
      children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 8.0),
        child: new TextFormField(
          decoration: new InputDecoration(labelText: 'Email', 
          border: OutlineInputBorder(),
          ),
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
          onSaved: (value) => _email = value,
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: 8.0),
        child: new TextFormField(
          decoration: new InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
          maxLines: 1,
          obscureText: true,
          validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
          onSaved: (value) => _password = value,
          
        ),
      )
      ],
    );
  }

  Widget _showButton() {
    return new Padding(
      padding: EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 0.0),
      child: new MaterialButton(
        elevation: 5.0,
        minWidth: 200,
        height: 42.0,
        color: Colors.grey,
        child: _formMode == FormMode.LOGIN ? new Text('Login') : new Text('Create Account'),
        onPressed: _validateAndSubmit,
      ),
    );
  }

  Widget _showTextButton() {
    return new FlatButton(
      child: _formMode == FormMode.LOGIN ? new Text('Create an account') : new Text('Already have account? SingIn'),
      onPressed: _formMode == FormMode.LOGIN ? _formSignUp : _formLogin,
    );
  }

  Widget _showError() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(_errorMessage);
    }
    return Container(
      height: 0.0,
    );
  }

}
