import 'package:flutter/material.dart';

class QuestMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Quest'),
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, i) {
            return QuestRow();
          },
        ));
  }
}

class QuestRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(8.0),
      child: new Card(
          clipBehavior: Clip.antiAlias,
          child: FlatButton(
            padding: EdgeInsets.all(0.0),
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => QuestDetail()));
            },
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/photogigs-79bd9.appspot.com/o/postsImage%2Fdff4b381-b368-430b-87a4-0c72cdca6627?alt=media&token=0bf171dd-57ed-4a0e-ac33-d22f04f38afa'),
                new Container(
                  padding: EdgeInsets.all(8.0),
                  child: new Row(
                    children: <Widget>[
                      new CircleAvatar(
                        radius: 24,
                        backgroundImage: new NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/photogigs-79bd9.appspot.com/o/profileImage%2FPhoto%20GIGS.jpg?alt=media&token=5477b9d7-79da-42e6-8349-e58f0d20a5a8'),
                      ),
                      new Container(
                          padding: EdgeInsets.all(8.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                'PhotoGigs',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              new Text(
                                'Active',
                                style: TextStyle(),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                new Container(
                  padding:
                      EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
                  child: new Text(
                    'Feb Quest : City night life on Vikandy',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class QuestDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Quest Detail'),
      ),
      body: new ListView(
                children: <Widget>[
                  new Container(
                      child: new Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/photogigs-79bd9.appspot.com/o/flamelink%2Fmedia%2F1547104932225_Screen%20Shot%202019-01-10%20at%2014.21.27.png?alt=media&token=9401a8b4-20a3-4e91-abc2-306e6f9e3dc6',
                    height: 250,
                    fit: BoxFit.cover,
                  )),
                  new Container(
                    padding: EdgeInsets.all(16.0),
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          'Night Beauty under the moon, catch the exotic moment together',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                          maxLines: 4,
                        ),
                        new Container(
                          padding: EdgeInsets.only(top: 16.0),
                          child: new Row(
                            children: <Widget>[
                              new Icon(Icons.date_range),
                              new Container(width: 16.0),
                              new Text('25 Feb 19')
                            ],
                          ),
                        ),
                        new Container(
                          padding: EdgeInsets.only(top: 8.0),
                          child: new Row(
                            children: <Widget>[
                              new Icon(Icons.monetization_on),
                              new Container(width: 16.0),
                              new Text('Free')
                            ],
                          ),
                        ),
                        new Container(
                          padding: EdgeInsets.only(top: 8.0),
                          child: new Row(
                            children: <Widget>[
                              new Icon(Icons.location_city),
                              new Container(width: 16.0),
                              new Text('Jakarta')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    padding: EdgeInsets.all(16.0),
                    // color: Colors.grey,
                    child: new Text(
                      'Detail',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Container(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      // color: Colors.grey,
                      child: new Text(
                          'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.')),
                  new Container(
                    height: 16.0,
                  )
                ],
              ),
    );
  }
}
