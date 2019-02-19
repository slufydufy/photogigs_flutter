import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PhotoGigsMain extends StatelessWidget {

final DocumentReference = Firestore.instance.document("models/AuBh4vnHNq9vYDNBt5SN");

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text('PhotoGigs'),
        ),
      ),
      body: new ListView(
        
        children: <Widget>[
          new Container(
            height: height*0.5,
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
          new Container(
              padding: EdgeInsets.only(top: 32.0, left: 24.0, right: 24.0),
              child: new Row(
                children: <Widget>[
                  new Text(
                    'Models',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  new Spacer(),
                  new Text(
                    'View All',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              )),
          new Container(
            padding: EdgeInsets.all(8.0),
            height: height*0.25,
            child:
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, i) {
                return ModelCardPG();
              },
            )
          ),
          new Container(
              padding: EdgeInsets.only(top: 32.0, left: 24.0, right: 24.0),
              child: new Row(
                children: <Widget>[
                  new Text(
                    'Photographers',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  new Spacer(),
                  new Text(
                    'View All',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              )),
          new Container(
            padding: EdgeInsets.all(8.0),
            height: height*0.25,
            child:
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, i) {
                return ModelCardPG();
              },
            )
          )
        ],
      ),
    );
  }
}

class ModelCardPG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return new Container(
      child: new Column(
        children: <Widget>[
          new Card(
            clipBehavior: Clip.antiAlias,

            child: new Image.network(

'https://firebasestorage.googleapis.com/v0/b/photogigs-79bd9.appspot.com/o/postsImage%2Fdff4b381-b368-430b-87a4-0c72cdca6627?alt=media&token=0bf171dd-57ed-4a0e-ac33-d22f04f38afa',
                height: height*0.2,
                width: height*0.2,
                fit: BoxFit.cover,),

          ),
          new Text('Model 1')
        ],
      ),
    );
  }
}