import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/Genre_Page/genre_selector.dart';
import 'drawer.dart';
import 'sliver_background.dart';

class Genre extends StatefulWidget {
  @override
  _GenreState createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      drawer: menuitems(),
      backgroundColor: Colors.black26,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                onPressed: () => print("More stuff"),
              ),
            ],
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){
                _scaffoldKey.currentState.openDrawer();
              },
            ),
            expandedHeight: 350.0,
            floating: true,
            pinned: true,
            snap: true,
            elevation: 50,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: panel(),
            ),
          ),
          SliverGrid.count(
              crossAxisCount: 2,
              children: <Widget>[
                select(this.context,"Cafe"),
                select(this.context,"Chill"),
                select(this.context,"Rain"),
                select(this.context,"Jazz"),
                select(this.context,"Chill"),
                select(this.context,"Chill"),
              ],
            ),
        ],
      ),
    );
  }
}




