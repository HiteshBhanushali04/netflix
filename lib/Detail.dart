import 'package:flutter/material.dart';

import 'data.dart';
import 'scrolltype2.dart';

class detailpage extends StatefulWidget {
  final index;

  const detailpage({Key key, this.index}) : super(key: key);

  @override
  _detailpageState createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Stack(
          children: <Widget>[
            Container(
              //height: 300,
              child: ClipPath(
                clipper: CircularClipper(),
                child: Image.network(
                  image[widget.index],
                  fit: BoxFit.fill,
                  height: 300,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Image.asset(
                  "assets/logo.png",
                  fit: BoxFit.fill,
                  width: 170,
                  height: 60,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 2.5 + 6,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [BoxShadow(blurRadius: 10, spreadRadius: 2)],
                ),
                child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: GestureDetector(
                        child: Icon(
                      Icons.play_arrow,
                      size: 50,
                      color: Color.fromRGBO(158, 31, 40, 0.8),
                    ))),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left:10,right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.grey[700],
                    size: 35,
                  ),
                  onPressed: () {}),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: Colors.grey[700],
                  size: 35,
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 70,right: 70),
                child: Text(
              name[widget.index].toUpperCase(),
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  wordSpacing: 2,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
            ),
            SizedBox(height: 5,),
            Text(
              "Adventur, family Fantasy".toUpperCase(),
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  wordSpacing: 2,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey[400]),
            ),
            SizedBox(height: 10,),
            Container(
              height: 40,
              width: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Icon(Icons.star,color: Colors.pinkAccent,size: 25,),
                  Icon(Icons.star,color: Colors.pinkAccent,size: 25,),
                  Icon(Icons.star,color: Colors.pinkAccent,size: 25,),
                  Icon(Icons.star,color: Colors.pinkAccent,size: 25,),
                  Icon(Icons.star,color: Colors.black,size: 25,)

                ],
                ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Year",
                      //maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          wordSpacing: 2,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[400]),
                    ),
                    Text(
                      year[widget.index],
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          wordSpacing: 2,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[800]),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Country",
                      //maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          wordSpacing: 2,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[400]),
                    ),
                    Text(
                      "USA",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          wordSpacing: 2,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[800]),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Lenght",
                      //maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          wordSpacing: 2,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[400]),
                    ),
                    Text(
                      length[widget.index],
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          wordSpacing: 2,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[800]),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5,),
            Padding(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: Text(
                "Steve Rogers, a rejected military soldier, transforms into Captain America after taking a dose of a \"Super-Soldier serum\". But being Captain America comes at a price as he attempts to take down a war monger and a terrorist organization.",
                //maxLines: 2,
                //textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    wordSpacing: 2,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey[400]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15),
              child: Container(
                  height: height / 4,
                  child: scrolltype2(index: 4,height:height ,width: width,)
              ),
            ),

          ],
        ),
      ]),
    );
  }
}

class CircularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - size.width / 4,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
