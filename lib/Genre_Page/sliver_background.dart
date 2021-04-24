import 'package:flutter/material.dart';

Widget panel(){
  return Stack(
    children: <Widget>[
      Image(
        image:AssetImage('images/sliver_back.jpeg'),
        fit: BoxFit.cover,
        height: 400.0,
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0.0,70.0,0.0,0.0),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0.0,0.0,0.0,7.0),
                      alignment: Alignment.center,
                      width: 170.0,
                      height: 170.0,
                      //color: Colors.blue,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/page_0.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => print("User_Id"),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,20.0),
                    child: Text("@user_id",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text("Performer of The Week",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}