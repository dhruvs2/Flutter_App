import 'package:flutter/material.dart';

Widget menuitems(){
  return Container(
    width: 200.0,
    child: Drawer(
      child: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0.0,20.0,0.0,0.0),
              child: ListTile(
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onTap: () => print("about us"),
                title:Text('Upload',style: TextStyle(color: Colors.white,fontSize: 20.0),),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
              child: ListTile(
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onTap: () => print("about us"),
                title:Text('Connect',style: TextStyle(color: Colors.white,fontSize: 20.0),),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
              child: ListTile(
                onTap: () => print("about us"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                title:Text('About Us',style: TextStyle(color: Colors.white,fontSize: 20.0),),
              ),
            ),
          ],
        ),

      ),
    ),


  );
}