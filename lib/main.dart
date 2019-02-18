import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'QuestMain.dart';
import 'ProfileMain.dart';
import 'PhotoGigsMain.dart';
import 'TalentMain.dart';

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
    new TimeLine(),
    new QuestMain(),
    new ProfileMain()
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
                  icon: new Icon(Icons.present_to_all), title: new Text('PhotoGigs')),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.whatshot), title: new Text('Talent')),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.timeline), title: new Text('Timeline')),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.style), title: new Text('Quest')),
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

class TimeLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
// StreamBuilder(
//   stream: FireStore.instance,
// )

        new Scaffold(
      appBar: AppBar(
        title: new Text('Timeline'),
      ),
      body: new ListView.builder(
        itemCount: 5,
        itemBuilder: (context, i) {
          return PostMainRow();
        },
      ),
    );
  }
}

class PostMainRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.0),
        child: new Card(
          child: new Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(top: 8.0, left: 8.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      child: new CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/photogigs-79bd9.appspot.com/o/postsImage%2Fdff4b381-b368-430b-87a4-0c72cdca6627?alt=media&token=0bf171dd-57ed-4a0e-ac33-d22f04f38afa'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    new Expanded(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                              padding: EdgeInsets.only(
                                  left: 8.0, right: 8.0, top: 8.0),
                              child: new Text('Baba black',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1)),
                          new Container(
                              padding: EdgeInsets.only(
                                  left: 8.0, right: 8.0, top: 8.0),
                              child: new Text(
                                '23 Jan 19',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: new TextStyle(
                                    fontSize: 12.0, color: Colors.grey),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                  padding: EdgeInsets.only(top: 8.0),
                  child: new FlatButton(
                    padding: EdgeInsets.all(0.0),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new ImageFull()));
                    },
                    child: new Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/photogigs-79bd9.appspot.com/o/postsImage%2F04c1de9f-808c-41c9-9cc8-deaa6a4603f2?alt=media&token=4fafbfe8-91f8-43b7-9787-f90c1c585a49'),
                  )),
              new Column(
                children: <Widget>[
                  new Container(
                      padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                      child: new Center(
                        child: new Text(
                          'Street photo is never boring, night life are so true',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ))
                ],
              ),
              PostActionWidget(),
            ],
          ),
        ));
  }
}

class PostActionWidget extends StatefulWidget {
  @override
  PostActionWidgetState createState() => PostActionWidgetState();
}

class PostActionWidgetState extends State<PostActionWidget> {
  bool isLiked = false;
  int likeCount = 0;
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(right: 16.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new IconButton(
            icon: (isLiked ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.white,
            onPressed: toggleLike,
          ),
          new IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new CommentMain()));
            },
            icon: new Icon(Icons.message, color: Colors.white),
          ),
          new IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new PostDetail()));
            },
            icon: new Icon(Icons.details, color: Colors.white),
          ),
          new Spacer(),
          new GestureDetector(
            child: new Text('$likeCount like'),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new CommentMain()));
            },
          ),
          new Container(
            width: 8.0,
          ),
          new FlatButton(
            padding: EdgeInsets.all(0.0),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new CommentMain()));
            },
            child: new Text('12 comments'),
          )
        ],
      ),
    );
  }

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount -= 1;
        isLiked = false;
      } else {
        likeCount += 1;
        isLiked = true;
      }
    });
  }
}

class ImageFull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Post'),
        ),
        body: new GestureDetector(
            child: Center(
          child: Hero(
              tag: 'imageHero',
              child: PhotoView(
                  imageProvider: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/photogigs-79bd9.appspot.com/o/postsImage%2F04c1de9f-808c-41c9-9cc8-deaa6a4603f2?alt=media&token=4fafbfe8-91f8-43b7-9787-f90c1c585a49'))),
        )));
  }
}

class PostDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Post Detail'),
        ),
        body: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: new Text(
                  'Detail',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              new Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                  child: new Card(
                      child: new Container(
                    padding: EdgeInsets.all(16.0),
                    child: new Column(children: <Widget>[
                      new Container(
                        padding: EdgeInsets.all(8.0),
                        child: new Row(
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.camera_alt, color: Colors.white),
                              ],
                            ),
                            new Container(
                              width: 16.0,
                            ),
                            new Expanded(
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                    'Nikon T100',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        padding: EdgeInsets.all(8.0),
                        child: new Row(
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.lens, color: Colors.white),
                              ],
                            ),
                            new Container(
                              width: 16.0,
                            ),
                            new Expanded(
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                    '2.5',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      new Container(
                          padding: EdgeInsets.all(8.0),
                          child: new Row(
                            children: <Widget>[
                              new Row(
                                children: <Widget>[
                                  new Icon(Icons.flash_on, color: Colors.white),
                                ],
                              ),
                              new Container(
                                width: 16.0,
                              ),
                              new Expanded(
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(
                                      'off',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                      new Container(
                          padding: EdgeInsets.all(8.0),
                          child: new Row(
                            children: <Widget>[
                              new Row(
                                children: <Widget>[
                                  new Icon(Icons.camera, color: Colors.white),
                                ],
                              ),
                              new Container(
                                width: 16.0,
                              ),
                              new Expanded(
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(
                                      '7.3',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                    ]),
                  ))),
            ]));
  }
}

class CommentMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Text('Comment'),
        ),
        body: new Column(
          children: <Widget>[
            new Expanded(
              child: new ListView.builder(
                itemCount: 11 + 1,
                itemBuilder: (context, i) {
                  if (i == 0) {
                    return new CommentTotal();
                  } else
                    return CommentRow();
                },
              ),
            ),
            new Container(
                color: Colors.black12,
                child: new Theme(
                  data: new ThemeData(
                      hintColor: Colors.black12,
                      primaryColor: Colors.greenAccent,
                      cursorColor: Colors.greenAccent),
                  child: new TextField(
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                    textInputAction: TextInputAction.send,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20.0),
                      hintText: 'write a positive comment',
                      hintStyle: TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ))
          ],
        ));
  }
}

class CommentTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Text('122 Comment'),
    );
  }
}

class CommentRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: new Column(
          children: <Widget>[
            new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/photogigs-79bd9.appspot.com/o/postsImage%2Fdff4b381-b368-430b-87a4-0c72cdca6627?alt=media&token=0bf171dd-57ed-4a0e-ac33-d22f04f38afa'),
                    backgroundColor: Colors.transparent,
                  ),
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          padding: EdgeInsets.only(left: 16.0),
                          child: new Text(
                            'Boby Sanjaya',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        new Container(
                          padding: EdgeInsets.only(left: 16.0, top: 4.0),
                          child: new Text(
                            '14 Feb 19',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: new TextStyle(
                                fontSize: 12.0, color: Colors.grey),
                          ),
                        ),
                        new Container(
                          padding: EdgeInsets.only(left: 16.0, top: 8.0),
                          child: new Text(
                            'Mantaph mas bero..!! tingkatkan, kancutkan, slangkangkan, lendirkan, setubuh....',
                            // overflow: TextOverflow.ellipsis
                            // softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
            new Divider()
          ],
        ));
  }
}
