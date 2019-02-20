import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'JobsMain.dart';
import 'ProfileMain.dart';
import 'PhotoGigsMain.dart';
import 'TalentMain.dart';
import 'QuestMain.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _gSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await _gSignIn.signIn();
    GoogleSignInAuthentication gSignAuth = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithCustomToken (
        
    );

  }

  int i = 0;
  var pages = [
    new PhotoGigsMain(),
    new TalentMain(),
    new JobsMain(),
    new QuestMain(),
    new ProfileMain(),
    
  ];
  @override
  Widget build(BuildContext context) {

    // if 

    return MaterialApp(
      title: "PhotoGigs",
      theme: ThemeData.dark(),
      home: Scaffold(
        body: pages[i],
        bottomNavigationBar: new BottomNavigationBar(
            items: [
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.home), title: new Text('PhotoGigs')),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.whatshot), title: new Text('Talent')),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.list), title: new Text('Jobs')),
                  new BottomNavigationBarItem(
                  icon: new Icon(Icons.timeline), title: new Text('Quest')),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.person), title: new Text('Profile'))
            ],
            currentIndex: i,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                i = index;
              });
            }),
      ),
    );
  }
}


