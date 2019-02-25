import 'package:flutter/material.dart';
import 'JobsMain.dart';
import 'ProfileMain.dart';
// import 'PhotoGigsMain.dart';
import 'TalentMain.dart';
import 'QuestMain.dart';
import 'LoginMain.dart';
import 'auth.dart';
import 'root_page.dart';
import 'HomeMain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'PhotoGigs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: new RootPage(
        auth: new Auth(),
        )
    );
  }
}


