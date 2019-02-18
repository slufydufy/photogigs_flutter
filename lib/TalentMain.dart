import 'package:flutter/material.dart';

class TalentMain extends StatefulWidget {
  @override
  TalentMainState createState() => TalentMainState();
}

class TalentMainState extends State<TalentMain>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text('Talent'),
          bottom: TabBar(
            tabs: <Widget>[
              new Tab(
                text: 'Models',
                // icon: new Icon(Icons.camera),
              ),
              new Tab(
                text: 'Photographers',
                // icon: new Icon(Icons.lens),
              )
            ],
            controller: _tabController,
          )),
      body: TabBarView(
        children: <Widget>[
          new Models(),
          new Photographers()
          ],
        controller: _tabController,
      ),
    );
  }
}

class Models extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: 24.0, bottom: 24.0, left: 16.0,
right: 16.0),
      child:
        new GridView.count(
          crossAxisCount: 2,
          children: List.generate(16, (index) {
            return ModelsRow();
          }),
        ),

    );
  }
}

class ModelsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Card(
            clipBehavior: Clip.antiAlias,
            child: new Image.network(
              'https://firebasestorage.googleapis.com/v0/b/photogigs-79bd9.appspot.com/o/postsImage%2Fdff4b381-b368-430b-87a4-0c72cdca6627?alt=media&token=0bf171dd-57ed-4a0e-ac33-d22f04f38afa',
              height: 150.0,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          new Text('Model 1')
        ],
      ),
    );
  }
}

class Photographers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: 24.0, bottom: 24.0, left: 16.0,
right: 16.0),
      child:
        new GridView.count(
          crossAxisCount: 2,
          children: List.generate(16, (index) {
            return ModelsRow();
          }),
        ),

    );
  }
}

class PhotographersRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Card(
            clipBehavior: Clip.antiAlias,
            child: new Image.network(
              'https://firebasestorage.googleapis.com/v0/b/photogigs-79bd9.appspot.com/o/postsImage%2Fdff4b381-b368-430b-87a4-0c72cdca6627?alt=media&token=0bf171dd-57ed-4a0e-ac33-d22f04f38afa',
              height: 150.0,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          new Text('Model 1')
        ],
      ),
    );
  }
}