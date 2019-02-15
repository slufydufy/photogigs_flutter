import 'package:flutter/material.dart';
// import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';

class EventMain extends StatefulWidget {
  @override
  EventMainState createState() => EventMainState();
}

class EventMainState extends State {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          title: new Text('Event'),
        ),
        body: new GridView.count(
          childAspectRatio: 0.75,
          padding: EdgeInsets.all(6.0),
          crossAxisCount: 2,
          children: List.generate(10, (index) {
            return new Column(
              children: <Widget>[
                new Expanded(
                  child: EventRow(),
                )
              ],
            );
          }),
        ));
  }
}

class EventRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new EventDetail()));
      },
      child: new Card(
          clipBehavior: Clip.antiAlias,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Container(
                  child: new Image.network(
                'https://firebasestorage.googleapis.com/v0/b/photogigs-79bd9.appspot.com/o/flamelink%2Fmedia%2F1547104932225_Screen%20Shot%202019-01-10%20at%2014.21.27.png?alt=media&token=9401a8b4-20a3-4e91-abc2-306e6f9e3dc6',
                height: 180.0,
                fit: BoxFit.cover,
              )),
              new Container(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                child: new Text(
                    'Night Beauty under the moon, catch the exotic moment together',
                    maxLines: 2,
                    style: TextStyle(color: Colors.white, fontSize: 16.0)),
              ),
              new Container(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: new Text('Feb 28, 19',
                    maxLines: 1, style: TextStyle(color: Colors.white70)),
              ),
              new Container(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: new Text(
                  'Jakarta',
                  maxLines: 1,
                  style: TextStyle(color: Colors.white54, fontSize: 12.0),
                ),
              )
            ],
          )),
    );
  }
}

class EventDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Text('Event Detail'),
        ),
        body: new Column(
          children: <Widget>[
            new Expanded(
              child: new ListView(
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
                    height: 8.0,
                  )
                ],
              ),
            ),
            new RaisedButton(
              onPressed: () async {
                const tel = '+62818832583';
                const url = 'tel:$tel';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not call $url';
                }
              },
              child: new Text('Call'),
              // padding: EdgeInsets.all(8.0),
              textColor: Colors.black,
              color: Colors.greenAccent,
            ),
          ],
        ));
  }
}
