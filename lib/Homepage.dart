import 'package:flutter/material.dart';

import 'data.dart';
import 'scrolltype2.dart';
import 'scrollview.dart';
import 'Detail.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  PageController _pageController;
  int initial = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =
        PageController(initialPage: initial, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                          onPressed: () {}),
                      Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.fill,
                        width: 150,
                        height: 60,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height / 4,
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      itemCount: image.length,
                      itemBuilder: (context, index) {
                        return _animationofpage(index, height / 4, width);
                      }),
                ), //scroll 1
                SizedBox(
                  height: 35,
                ),
                Container(
                    height: height / 7.8,
                    child: ListView.builder(
                        itemCount: image.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 150,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                  image: NetworkImage(image[index]),
                                  fit: BoxFit.fill,
                                )),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromRGBO(212, 82, 83, 0.49),
                                        Color.fromRGBO(158, 31, 40, 0.49),
                                      ],
                                      stops: [0.3, 0.7],
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      menutype[index].toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ),
                                )),
                          );
                        })), //Scroll 2
                Container(
                  height: height / 3.5,
                  child: scrollmenu(index: 0,height:height ,width: width,)
                  ),
                Container(
                    height: height / 4.5,
                    child: scrolltype2(index: 2,height:height ,width: width,)
                ),
                Container(
                    height: height / 3.5,
                    child: scrollmenu(index: 1,height:height ,width: width,)
                ),
                Container(
                    height: height / 4.5,
                    child: scrolltype2(index: 4,height:height ,width: width,)
                ),
                Container(
                    height: height / 3.5,
                    child: scrollmenu(index: 3,height:height ,width: width,)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _animationofpage(int index, double height, double width) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;

          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            width: Curves.easeInOut.transform(value) * width,
            height: Curves.easeInOut.transform(value) * height,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
            detailpage(index: index)
          ));
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(25), boxShadow: [
            BoxShadow(
              //color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 5,
              //offset: Offset(3, 5),
            )
          ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              image[index],
              fit: BoxFit.fill,
              height: height,
              width: width,
            ),
          ),
        ),
      ),
    );
  }
}
