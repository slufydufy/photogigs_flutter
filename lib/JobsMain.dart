import 'package:flutter/material.dart';
import 'QuestMain.dart';

class JobsMain extends StatefulWidget {
  @override
  JobsMainState createState() => JobsMainState();
}

class JobsMainState extends State<JobsMain>
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
          title: new Text('Jobs'),
          bottom: TabBar(
            tabs: <Widget>[
              new Tab(
                text: 'Model Jobs',
              ),
              new Tab(
                text: 'Photographer Jobs',
              )
            ],
            controller: _tabController,
          )),
      body: TabBarView(
        children: <Widget>[new JobModel(), new JobPhotographer()],
        controller: _tabController,
      ),
    );
  }
}

class JobModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      // padding: EdgeInsets.only(top: 24.0, bottom: 24.0, left: 16.0, right: 16.0),
      child: new ListView.builder(
        itemCount: 4,
        itemBuilder: (context, i) {
          return JobModelRow();
        },
      ),
    );
  }
}

class JobModelRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
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
                new Container(
                  padding:
                      EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: new Text(
                    'Need red hair model for clothing line photo shoot',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.greenAccent
                    ),
                    maxLines: 2,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: new Row(
                    children: <Widget>[
                      new Icon(Icons.date_range),
                      new Container(width: 16,),
                      new Text('28 Feb 19')
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                  child: new Row(
                    children: <Widget>[
                      new Icon(Icons.location_city),
                      new Container(width: 16,),
                      new Text('Jakarta')
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0, bottom: 16.0),
                  child: new Row(
                    children: <Widget>[
                      new Icon(Icons.monetization_on),
                      new Container(width: 16,),
                      new Text('1,500,000')
                    ],
                  ),
                ),
                
              ],
            ),
          )),
    );
  }
}

class JobPhotographer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new ListView.builder(
          itemCount: 4,
          itemBuilder: (context, i) {
            return JobModelRow();
          },
        ));
  }
}
