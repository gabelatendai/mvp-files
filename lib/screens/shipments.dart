
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class Shipments extends StatefulWidget {
  Shipments({Key key}) : super(key: key);

  @override
  _ShipmentsState createState() => _ShipmentsState();
}

class _ShipmentsState extends State<Shipments> {
  @override
  List<String> data=["1222  6464  7575 755757 444",
    "3344 4242 5353 75854 633","4566 4563 3332 4453 ",
    "63636 6363 63535 5363 ","3445 35353 673636 73"];
  var _color = Colors.red;
  var _height = 100.0;
  var _width = 100.0;
  var button = "SHIP NOW";
  var subText = "Date";
  var _isFirstCrossFadeEnabled = false;
  var _opacity = 0.0;

  animateContainer() {

    if (button=="cancel") {
      setState(() {
        var button = "SHIP NOW";
        subText = "Zimwe";
        button = "ShipNow";
        _color = _color == Colors.red ? Colors.green : Colors.red;
        _height = _height == 100 ? 200 : 100;
        _width = _width == 100 ? 200 : 100;
      });
    }else{
      setState(() {
        subText = "Yes";
        button = "Cancel";
        _color = _color == Colors.red ? Colors.green : Colors.red;
        _height = _height == 100 ? 200 : 100;
        _width = _width == 100 ? 200 : 100;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("apppp"),),
        body: Container(
            child: Container(
                padding: EdgeInsets.only(left:20),
                child: Column(children: <Widget>[
                  Row(

                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            //height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(width: 1, color: Colors.black)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  //      TabBar(tabs: null),
                                  Text('ONGOING\nSHIPMENTS',
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                                  verticalDivider(),
                                  Text('PENDING\nSHIPMENTS',
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                                  verticalDivider(),
                                  Text('SHIPPING\nHISTORY',
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                                ])
                        )]),

                  Expanded(
                    child:ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context,i){
                          String item=data[i];
                          return Dismissible(
                              key: Key(item),

                              background: Container(
                                child: Text("delete".toUpperCase(),style: TextStyle(
                                  fontSize: 12,
                                ),),
                                color: Colors.red[200],
                                alignment: Alignment.centerLeft,
                              ),
                              // secondaryBackground: Container(
                              //   child: Icon(Icons.thumb_up),
                              //   color: Colors.green,
                              //   alignment: Alignment.centerRight,
                              // ),
                              child: Container(
                                  padding: EdgeInsets.only(top:10),
                                  child: Row(
                                    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      //  SizedBox(width: 15),
                                      Container(


                                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                        height: 140,
                                        width: MediaQuery.of(context).size.width * 0.90,
                                        decoration: BoxDecoration(
                                          color: _color,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                  child:
                                  AnimatedContainer(
                                  duration: Duration(seconds: 1),


                                          child:
                                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                            Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                        text: 'Shipping ID',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color:Colors.black45,
                                                        ),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text: ' 12345678',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight: FontWeight.w800,
                                                                  color: Colors.blue,
                                                                  fontFamily: 'Poppins'),
                                                              recognizer: TapGestureRecognizer()..onTap = () {})
                                                        ]),
                                                  ),
                                                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                    Text('From:',
                                                        style: TextStyle(fontSize: 12, color: Colors.black45)),
                                                    SizedBox(height: 3),
                                                    Text('Al Wada Mall',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400,
                                                            color: Colors.pink))
                                                  ]),
                                                  Text('$subText',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w700,
                                                          color: Colors.redAccent))
                                                ]),
                                            Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text('rightTopText',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w700,
                                                          color: Colors.redAccent)),
                                                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                                                    Text('To:',
                                                        style: TextStyle(fontSize: 12, color: Colors.black45),
                                                        textAlign: TextAlign.right),
                                                    SizedBox(height: 3),
                                                    Text('My House',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400,
                                                            color: Colors.purple),
                                                        textAlign: TextAlign.right)
                                                  ]),
                                                  RaisedButton(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(10.0),
                                                          side: BorderSide(color: Colors.black45)
                                                      ),
                                                      color: Colors.black26,
                                                      onPressed: () {
                                                        print('More info');
                                                      },
                                                      child: Text('Shipping Details'.toUpperCase(),
                                                          style: TextStyle(color: Colors.white, fontSize: 12)))
                                                ])
                                            ,
                                            VerticalDivider(),
                                            Container(
                                              child:InkWell(
                                                onTap: () {
                                            animateContainer();
                                            },
                                                child:RotatedBox(
                                                  quarterTurns: 1,
                                                  child: Text("${button}"),
                                                ) )
                                            )
                                          ])),
                                      //SizedBox(height: 15),r
                                  ),
                                    ],
                                  ))
                          );
                        }
                    ),
                  )
                ]
                )
            )

        ));
  }
  Widget itemBox(
      {Color color,
        Color textColor,
        Color subTextColor,
        Color topTextColor,
        String subText,
        String rightTopText}) {
    return Container(


        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        height: 140,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Shipping ID',
                      style: TextStyle(
                        fontSize: 12,
                        color:Colors.black45,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' 12345678',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: textColor,
                                fontFamily: 'Poppins'),
                            recognizer: TapGestureRecognizer()..onTap = () {})
                      ]),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('From:',
                      style: TextStyle(fontSize: 12, color: Colors.black45)),
                  SizedBox(height: 3),
                  Text('Al Wada Mall',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: textColor))
                ]),
                Text('$subText',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.redAccent))
              ]),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(rightTopText,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.redAccent)),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text('To:',
                      style: TextStyle(fontSize: 12, color: Colors.black45),
                      textAlign: TextAlign.right),
                  SizedBox(height: 3),
                  Text('My House',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: textColor),
                      textAlign: TextAlign.right)
                ]),
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.black45)
                    ),
                    color: Colors.black26,
                    onPressed: () {
                      print('More info');
                    },
                    child: Text('Shipping Details'.toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 12)))
              ])
          ,
          VerticalDivider(),
          Container(
              child:RotatedBox(
                quarterTurns: 1,
                child: const Text('SHIP NOW'),
              )
          )
        ]));

  }
  Widget verticalDivider() {
    return Container(height: 60, width: 2, color: Colors.black);
  }
}