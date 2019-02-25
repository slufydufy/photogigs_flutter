import 'package:flutter/material.dart';
import 'auth.dart';

class ProfileMain extends StatefulWidget {

ProfileMain({this.auth, this.onSignedOut});

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  
  @override
  ProfileMainState createState() => ProfileMainState();
}

class ProfileMainState extends State<ProfileMain> {

  _signedOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return new Scaffold(
        appBar: AppBar(
          title: new Text('Profile Main'),
          actions: <Widget>[
          new FlatButton(
            child: new Text('LogOut'),
            onPressed: _signedOut,
          )
        ],
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Container(
                padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: new Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/photogigs-79bd9.appspot.com/o/postsImage%2F04c1de9f-808c-41c9-9cc8-deaa6a4603f2?alt=media&token=4fafbfe8-91f8-43b7-9787-f90c1c585a49',

                      height: height*0.4,
                      fit: BoxFit.cover,
                    ))),
                    new Container(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      child: new Card(
                        child: new Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 8.0),
                              child: new Text('Jeff Rozok', style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600
                      ),),
                            ),
                      Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: new Text('Ciseeng Jabar', style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w100,
                            color: Colors.grey
                        ),),
                      ),
                          ],
                        ),
                      )
                    )
          ],
        ));
  }
}
