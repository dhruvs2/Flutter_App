import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'Genre_Page/genre_page.dart';

class Music extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {

  PageController _controller = PageController(
    initialPage: 0,
  );
  String _demotext = "Hello World";
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              child: Image.asset('images/page_0.jpg',height:1200.0,fit: BoxFit.fill,),
            ),
          ],
        ),
        Genre(),
      ],
    );
    /*return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('New One',
        style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () => _change(),
          ),
        ],
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10.0),
          width: 300.0,
          height: 300.0,
          color: Colors.blueAccent,
          child: Text(_demotext,style: TextStyle(
            color: Colors.white,
            fontSize: 50.0,
          ),),
        ),
      ),
    ); */
  }
}
