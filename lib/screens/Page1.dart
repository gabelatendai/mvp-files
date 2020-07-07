import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:io';

class Page1 extends StatefulWidget {
  String title = "My yry";
  Page1({@required this.title});
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    TextStyle _statLabelTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 14.0,
      //fontWeight: FontWeight.bold,
    );

    TextStyle _statCountTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 12.0,
      fontWeight: FontWeight.w200,
    );
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        SizedBox(height: 200),
        Container(
          // padding: EdgeInsets.only(top:20),
          child: _buildCoverImage(screenSize),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Container(
                // padding: EdgeInsets.only(left:20),
                child: Column(
              children: <Widget>[
                SizedBox(height: 200),
                infoCard(context, "My Profile"),
                Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("Edit Account", textAlign: TextAlign.right),
                          ]),
                      _buildBio(context),
                      SizedBox(height: 30.0),
                      _buildDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Phone", style: _statCountTextStyle),
                              SizedBox(height: 10.0),
                              Text("+971 2 444 3567"),
                            ],
                          ),
                          // Flexible(fit: FlexFit.tight, child: SizedBox()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Fax", style: _statCountTextStyle),
                              SizedBox(height: 10.0),
                              Text("+971 2 444 1164"),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Email", style: _statCountTextStyle),
                              SizedBox(height: 10.0),
                              Text("adil@gmail.com"),
                            ],
                          ),
                          // Flexible(fit: FlexFit.tight, child: SizedBox()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Website", style: _statCountTextStyle),
                              SizedBox(height: 10.0),
                              Text("HomeDevo.com"),
                            ],
                          ),
                        ],
                      ),
                    ]))
              ],
            )),
          ),
        ),
      ],
    );
  }

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      // padding: EdgeInsets.only(top:100.0),
      height: screenSize.height / 3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/n.jpg'),
          // fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget frostedEdged(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 3.0), child: child));
  }

  Widget infoCard(BuildContext context, String title) {
    return frostedEdged(Container(
        width: 500,
        key: ValueKey<String>(title),
        height: 80,
        color: Colors.white.withOpacity(0.3),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                "Adil Devo".toUpperCase(),
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Text(
                "HomeDevo Online Store",
                style: TextStyle(fontSize: 12.0, color: Colors.white),
              ),
              SizedBox(height: 5.0),
              Text(
                "Express Points: 23,456",
                style: TextStyle(fontSize: 12.0, color: Colors.purple),
              ),
            ],
          ),
        )));
  }

  Widget _buildStatus(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),

      child: Text(
        "Edit Profile",
        style: TextStyle(
          fontFamily: 'Spectral',
          color: Colors.black,
          fontSize: 12.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 12.0,
      fontWeight: FontWeight.w200,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(children: <Widget>[
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            // padding: EdgeInsets.only(left:0.0),
            child: Text(
              "Address",
              style: bioTextStyle,
            ),
          ),
        ]),
        Row(children: <Widget>[
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            //padding: EdgeInsets.all(8.0),
            child: Text(
              "Office #303, Abu Dhabi Plaza Complex",
              textAlign: TextAlign.center,
              //style: bioTextStyle,
            ),
          ),
        ]),
        Row(children: <Widget>[
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            //padding: EdgeInsets.all(8.0),
            child: Text(
              '6 Fatima Bint Mubarak St.,',
              textAlign: TextAlign.center,
              // style: bioTextStyle,
            ),
          ),
        ]),
        Row(children: <Widget>[
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            //padding: EdgeInsets.all(8.0),
            child: Text(
              "Abu Dhabi",
              textAlign: TextAlign.center,
              //  style: bioTextStyle,
            ),
          ),
        ]),
        Row(children: <Widget>[
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            //padding: EdgeInsets.all(8.0),
            child: Text(
              "P.O.box: 26291".toUpperCase(),
              textAlign: TextAlign.center,
              // style: bioTextStyle,
            ),
          ),
        ]),
      ],
    );
  }

  Divider _buildDivider() {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 12.0,
      fontWeight: FontWeight.w200,
    );
    return Divider(
      color: Colors.black,
    );
  }

  Widget _buildStatItem(String label, String count) {
    TextStyle _statLabelTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 14.0,
      //fontWeight: FontWeight.bold,
    );

    TextStyle _statCountTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 12.0,
      fontWeight: FontWeight.w200,
    );

    return Row(children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            count,
            style: _statCountTextStyle,
          ),
          SizedBox(height: 10.0),
          Text(
            label,
            style: _statLabelTextStyle,
          ),
        ],
      )
    ]);
  }
}
