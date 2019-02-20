import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class PhotoGigsMain extends StatefulWidget {
  @override
  PhotoGigsMainState createState() => PhotoGigsMainState();
}

class PhotoGigsMainState extends State<PhotoGigsMain> {

final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _signIn = new GoogleSignIn();

  Future<FirebaseUser> _gSignIn() async {
    GoogleSignInAccount googleSignInAccount = await _signIn.signIn();
    GoogleSignInAuthentication gSignAuth = await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: gSignAuth.accessToken,
      idToken: gSignAuth.idToken
    );
    FirebaseUser user = await _auth.signInWithCredential (credential);
    assert(user.displayName != null);
    print(user.displayName);
    return user;
  }

  void _gSignOut() {
    _signIn.signOut();
    print('Sign Out');
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: new AppBar(
        title: new Text('PhotoGigs'),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: height * 0.4,
            padding: EdgeInsets.all(8.0),
            child: new Carousel(
              boxFit: BoxFit.cover,
              images: [
                NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/photogigs-79bd9.appspot.com/o/postsImage%2Fbbeee748-99cf-4e63-9da5-4568050f793d?alt=media&token=c6eea866-17e7-48f5-9353-4339b72fad43'),
                NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/photogigs-79bd9.appspot.com/o/postsImage%2Fdff4b381-b368-430b-87a4-0c72cdca6627?alt=media&token=0bf171dd-57ed-4a0e-ac33-d22f04f38afa'),
                NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/photogigs-79bd9.appspot.com/o/postsImage%2F04c1de9f-808c-41c9-9cc8-deaa6a4603f2?alt=media&token=4fafbfe8-91f8-43b7-9787-f90c1c585a49'),
                NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/photogigs-79bd9.appspot.com/o/postsImage%2F1313bd2e-fcb8-4f6a-aa5b-ea823c04c493?alt=media&token=9823d25c-060c-4634-b6b7-254e924b2a51')
              ],
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 1500),
              dotSize: 6.0,
              indicatorBgPadding: 15.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Center(
                child: new Container(
                    padding: EdgeInsets.only(top: 8.0),
                    child: RaisedButton(
                      child: new Text(
                        'Post Job',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      textColor: Colors.black,
                      color: Colors.greenAccent,
                      onPressed: () {},
                    )),
              ),
              new Center(
                child: new Container(
                    padding: EdgeInsets.only(top: 8.0),
                    child: RaisedButton(
                      child: new Text(
                        'Find Job',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      textColor: Colors.white,
                      color: Colors.blueAccent,
                      onPressed: () {},
                    )),
              ),
            ],
          ),
          new Center(
            child: new Container(
              padding: EdgeInsets.only(top: 8.0),
              child: new Text('Post or Find a photography related job Now'),
            ),
          ),
          new Center(
            child: new RaisedButton(
              onPressed: () => _gSignIn().then((FirebaseUser user) => print(user)).catchError((e) => print(e)) ,
              child: new Text('GoogleSignIn'),
            ),
          ),
          new Center(
            child: new RaisedButton(
              onPressed: _gSignOut,
              child: new Text('SignOut'),
            ),
          ),
          new Container(
              padding: EdgeInsets.only(top: 32.0, left: 8.0, right: 8.0),
              child: new Row(
                children: <Widget>[
                  new Text(
                    'Models',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  new Spacer(),
                  new Text(
                    'View All',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              )),
          new Container(
              padding: EdgeInsets.all(4.0),
              height: height * 0.25,
              child: ModelMainList()),
          new Container(
              padding: EdgeInsets.only(top: 24.0, left: 8.0, right: 8.0),
              child: new Row(
                children: <Widget>[
                  new Text(
                    'Photographers',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  new Spacer(),
                  new Text(
                    'View All',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              )),
          new Container(
              padding: EdgeInsets.all(4.0),
              height: height * 0.25,
              child: PhotograpersMainList())
        ],
      ),
    );
  }
}

class ModelMainList extends StatefulWidget {
  @override
  ModelMainListState createState() => ModelMainListState();
}

class ModelMainListState extends State<ModelMainList> {
  Future _data;

  Future fetchModel() async {
    var ref = Firestore.instance;
    QuerySnapshot qm = await ref.collection('models').getDocuments();
    return qm.documents;
  }
  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ModelDetail(
                  post: post,
                )));
  }
  @override
  void initState() {
    super.initState();
    _data =fetchModel();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: FutureBuilder(
          future: _data,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text('Loading..'),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return FlatButton(
                    onPressed: () => navigateToDetail(snapshot.data[i]),
                    padding: EdgeInsets.all(0.0),
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          clipBehavior: Clip.antiAlias,
                          child: new Image.network(
                            snapshot.data[i].data['picUrl'],
                            height: height * 0.2,
                            width: height * 0.2,
                            fit: BoxFit.cover,
                          ),
                        ),
                        new Text(
                          snapshot.data[i].data['name'],
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        )
                      ],
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}

class PhotograpersMainList extends StatefulWidget {
  @override
  PhotograpersMainListState createState() => PhotograpersMainListState();
}

class PhotograpersMainListState extends State<PhotograpersMainList> {

  Future _data;

  Future fetchModel() async {
    var ref = Firestore.instance;
    QuerySnapshot qm = await ref.collection('models').getDocuments();
    return qm.documents;
  }

  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ModelDetail(
                  post: post,
                )));
  }

  @override
  void initState() {
    super.initState();
    _data = fetchModel();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: FutureBuilder(
          future: _data,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text('Loading..'),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return FlatButton(
                    padding: EdgeInsets.all(0.0),
                    onPressed: () => navigateToDetail(snapshot.data[i]),
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          clipBehavior: Clip.antiAlias,
                          child: new Image.network(
                            snapshot.data[i].data['picUrl'],
                            height: height * 0.2,
                            width: height * 0.2,
                            fit: BoxFit.cover,
                          ),
                        ),
                        new Text(
                          snapshot.data[i].data['name'],
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        )
                      ],
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}

class ModelDetail extends StatefulWidget {
  final DocumentSnapshot post;
  ModelDetail({this.post});

  @override
  ModelDetailState createState() => ModelDetailState();
}

class ModelDetailState extends State<ModelDetail> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return new Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Container(
                padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: new Image.network(
                      widget.post.data['picUrl'],
                      height: height * 0.4,
                      fit: BoxFit.cover,
                    ))),
            new Container(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: new Card(
                  child: new Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 8.0),
                        child: new Text(
                          widget.post.data['name'],
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: new Text(
                          widget.post.data['location'],
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w100,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ));
  }
}
