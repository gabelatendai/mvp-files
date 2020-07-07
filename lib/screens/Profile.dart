import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mvp/screens/PackagsPage.dart';
import 'package:mvp/screens/listview.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Page3.dart';

class PageProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
          fontFamily: 'Roboto',
          primaryColor: Colors.white,
          primaryColorDark: Colors.white,
          backgroundColor: Colors.white),
      routes: <String, WidgetBuilder>{
        '/homepage': (BuildContext contenxt) => MyHomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

int _currentIndex = 0;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageNewState createState() => _MyHomePageNewState();
}

class _MyHomePageNewState extends State<MyHomePage> {
  final tabs = [
    Page1(),
    ImagePicka(),
    Page3(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Page1();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: EdgeInsets.only(left: 12),
              child: IconButton(
                icon: Icon(Icons.home),
                color: Colors.pink,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PackagesPage()),
                  );
                },
              ),
            ),
            title: Text("My Profile"),
          ),
          //  drawer: DrawerWidget(),
          body: tabs[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.deepPurple,
              unselectedItemColor: Colors.white,
              backgroundColor: Colors.purple,
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.camera,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Profile'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.cashRegister,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Payment Details'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.shoppingBag,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Billing Details'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
              // selectedItemColor:Colors.red,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                  // navigateToScreens(index);
                });
              }),
        ));
  }
}
