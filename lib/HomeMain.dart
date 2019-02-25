import 'package:flutter/material.dart';
import 'JobsMain.dart';
import 'ProfileMain.dart';
import 'PhotoGigsMain.dart';
import 'TalentMain.dart';
import 'QuestMain.dart';
import 'auth.dart';


class HomeMain extends StatefulWidget {

HomeMain({this.auth, this.userId, this.onSignedOut});


  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;


  @override
  HomeMainState createState() => HomeMainState();
}

class HomeMainState extends State<HomeMain> {
  int i = 0;
  var pages = [
    new PhotoGigsMain(),
    new TalentMain(),
    new JobsMain(),
    new QuestMain(),
    new ProfileMain(),
    
  ];

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
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
    );
  }
}


