import 'package:flutter/material.dart';
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


