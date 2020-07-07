import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mvp/screens/Profile.dart';
Widget appBarWidget(context) {
  return AppBar(
    backgroundColor: Colors.purple,
    elevation: 0.0,
    centerTitle: true,
    title: Text("Add Packages".toUpperCase()),
    actions: <Widget>[
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageProfile()),

          );
        },
         icon: Icon(FontAwesomeIcons.user),
        color: Color(0xFF323232),
      ),
    ],
  );
}
