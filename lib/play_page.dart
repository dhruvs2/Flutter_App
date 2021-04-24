import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class Play_Page extends StatefulWidget {
  @override
  _Play_PageState createState() => _Play_PageState();
}

class _Play_PageState extends State<Play_Page> {

  bool _isplaying = false;
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState(){
    super.initState();
    initPlayer();
  }

  void initPlayer(){
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
      _duration = d;
    });

    advancedPlayer.positionHandler = (p) => setState(() {
      _position = p;
    });
  }

  String localFilePath;
  void seekToSecond(int second){
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

   _toggleplaying(){
    setState(() {
      if(_isplaying) {_isplaying = false;advancedPlayer.pause();}
      else {_isplaying = true;audioCache.play('sample.mp3');}
    });
  }
  _backbutton(){
    advancedPlayer.stop();
    Navigator.pop(context);
  }

  Future <bool> _willPopCallback() async {
    await advancedPlayer.stop();
    return true; // return true if the route to be popped
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage("images/play.jpg"),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 100,
              height: MediaQuery.of(context).size.height * 100,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.45),
              ),
            ),
          ),
          Positioned(    // To take AppBar Size only
            top: 0.0,
            left: 0.0,
            right: 0.0,
            //bottom: 10.0,
            child: AppBar(
              backgroundColor: Colors.transparent.withOpacity(0.45),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.grey,
                onPressed: () => _backbutton(),
              ),
              primary: true,
              title: Column(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
                      child: Text("Playing From",style: TextStyle(color: Colors.white),),
                  ),
                  Container(child: Text("This n That",style: TextStyle(color: Colors.grey,fontSize: 15.0),)),
                ],
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu, color: Colors.grey), onPressed: () {},),
              ],
            ),
          ),

          Column(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0,100.0,0.0,20.0),
                  child: Container(
                    //margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.8,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/play.jpg"),
                        fit: BoxFit.fill
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 100,
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,10.0),
                  child: Text("What do you want from me",style: TextStyle(color: Colors.white,fontSize: 25.0),),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 100,
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,10.0),
                  child: Text("Pink Floyd",style: TextStyle(color: Colors.white,fontSize: 15.0),),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
                child: Slider(
                    value: _position.inSeconds.toDouble(),
                    activeColor: Colors.white,
                    inactiveColor: Colors.white,
                    min: 0.0,
                    max: _duration.inSeconds.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        seekToSecond(value.toInt());
                        value = value;
                      });}),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 100,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0.5),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 100,
                  height: MediaQuery.of(context).size.height * 0.15,
                  //color:  Colors.blue,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.arrow_upward),
                          color: Colors.white,
                          iconSize: 30,
                          onPressed: () => {},
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.arrow_left),
                          iconSize: 50,
                          color: Colors.white,
                          onPressed: () => {},
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: (_isplaying ? Icon(Icons.pause_circle_outline) : Icon(Icons.play_circle_outline)),
                          color: Colors.white,
                          iconSize: 70,
                          onPressed: () => _toggleplaying(),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.arrow_right),
                          iconSize: 50,
                          color: Colors.white,
                          onPressed: () => {},
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 30,
                          color: Colors.white,
                          onPressed: () => {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )
      ),
    );
  }
}
