import 'package:flutter_app/play_page.dart';
import 'package:flutter/material.dart';

Map <String,String> map = {
  'Chill' : 'images/page_0.jpg',
  'Jazz' : 'images/page_0.jpg',
  'Cafe' : 'images/page_0.jpg',
  'Rain' : 'images/page_0.jpg',
};

Widget select(BuildContext context,String genre){
  return Card(
    child: InkWell(
      highlightColor: Colors.grey,
      onTap: () {
        String gen = "jsafg";
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Play_Page())
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(genre,style: _easy(),),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(map[genre]),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ),
  );
}

TextStyle _easy(){
  return TextStyle(
    color: Colors.white,
    fontSize: 30.0,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );
}

