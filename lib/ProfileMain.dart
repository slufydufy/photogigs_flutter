import 'package:flutter/material.dart';

class ProfileMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Text('Profile Main'),
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Container(
                // height: MediaQuery.of(context).size.height * 0.3,
                // padding: EdgeInsets.only(left:32.0, right: 32.0, top: 16.0),
                child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: new Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/photogigs-79bd9.appspot.com/o/postsImage%2F04c1de9f-808c-41c9-9cc8-deaa6a4603f2?alt=media&token=4fafbfe8-91f8-43b7-9787-f90c1c585a49',
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ))),
                    new Container(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: new Card(
                        child: new Column(
                          children: <Widget>[
                            new Text('Jeff Rozok', style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600
                      ),),
                      new Text('Ciseeng Jabar', style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w100,
                          color: Colors.grey
                      ),),
                          ],
                        ),
                      )
                    )
          ],
        ));
  }
}
