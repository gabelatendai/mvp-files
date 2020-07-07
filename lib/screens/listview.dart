import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Flexible(
              child: new MyContainer(
                color: Colors.red,
              ),
            ),
            new Flexible(
              child: new MyContainer(
                img: "http://www.clker.com/cliparts/F/v/O/6/E/c/cartoon-rubber-duck-hi.png",
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  String img;
  Color color;
  MyContainer ({this.img,this.color});
  @override
  Widget build(BuildContext context) {
    return this.img!=null? new Container(
      decoration: new BoxDecoration(
          image:new DecorationImage(
              image: new NetworkImage(this.img)
          )
      ),
    ): new Container(
      decoration: new BoxDecoration(
          color: this.color
      ),
    );
  }
}