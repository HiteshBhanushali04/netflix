import 'package:flutter/material.dart';
import 'Detail.dart';
import 'data.dart';

class scrollmenu extends StatefulWidget {
  final height;
  final index;
  final width;

  const scrollmenu({Key key, this.height, this.width, this.index})
      : super(key: key);

  @override
  _scrollmenuState createState() => _scrollmenuState();
}

class _scrollmenuState extends State<scrollmenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:15.0,right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                typeoflist[widget.index],
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        //SizedBox(height: ,),
        Container(
          height: widget.height*.2,
          //margin: EdgeInsets.symmetric(horizontal: 15,),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: image.length,
              itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    detailpage(index: index)
                ));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(
                    color: Colors.grey[500],
                    blurRadius: 5,
                    spreadRadius: 2,
                    //offset: Offset(3,20)
                  ),]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    image[index],
                    fit: BoxFit.fill,
                    //height: widget.height*.4,
                    width: 130,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
