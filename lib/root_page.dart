import 'package:flutter/material.dart';
import 'auth.dart';
import 'LoginMain.dart';
import 'HomeMain.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;

  @override
  RootPageState createState() => RootPageState();
}

enum AuthStatus {
notDetermined,
loggedIn,
notLoggedIn
}

class RootPageState extends State<RootPage> {

  AuthStatus _authStatus = AuthStatus.notDetermined;
  String _userId = "";

   @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        _authStatus = user?.uid == null ? AuthStatus.notLoggedIn : AuthStatus.loggedIn;
      });
    });
  }

  void _onLoggedIn() {
    widget.auth.currentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
      });
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    });
  }

  void onSignOut() {
    setState(() {
      _authStatus = AuthStatus.notLoggedIn;
      _userId = "";
    });
  }
  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (_authStatus) {
      case AuthStatus.notDetermined:
        return _buildWaitingScreen();
          break;
      case AuthStatus.notLoggedIn:
        return new LoginMain(
          auth: widget.auth,
          onSignIn: _onLoggedIn,
        );
        break;
      case AuthStatus.loggedIn:
      if (_userId.length > 0 && _userId != null) {
        return new HomeMain(
          // userId: _userId,
          // auth: widget.auth,
          // onSignedOut: onSignOut,
        );
      } else return _buildWaitingScreen();
      break;
      default: return _buildWaitingScreen();

    }
    
  }
}