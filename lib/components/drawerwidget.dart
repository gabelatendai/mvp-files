import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String name = "";
  String msg ='Please Login';
  String txt ='Sign In';
  String log ='Register';
  // final Color primary = Colors.purpleAccent;
  // final Color active = Colors.white;

  @override
  Widget build(BuildContext context) {
    return  ClipPath(
//      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: Colors.grey, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top:40),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  height: 50,
//                            color: Colors.purple,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          colors: [Colors.pink, Colors.deepPurple])),
                                  child:CircleAvatar(
                                    radius: 40,
                                    child: ClipOval(
                                      child: Image.asset('assets/user.png',
                                        fit: BoxFit.cover,
                                      )
                                    ),
                                  ),

                              ),
                              SizedBox(height: 5.0),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Adil Devo",
                                    style: TextStyle(color: Colors.white, fontSize: 18.0,fontWeight: FontWeight.w700,),
                                  ),
                                  Text(
                                    "Home Devo Online Store",
                                    style: TextStyle(color: Colors.redAccent, fontSize: 10.0),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                        _buildDivider(),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Expanded(child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.pin_drop,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                Text("53",style: TextStyle(
                                    color: Colors.white,fontWeight: FontWeight.w700,
                                ),),
                                Text("Locations",style: TextStyle(
                                    color: Colors.white,fontSize: 10,
                                ),)
                              ],
                            ),),
                            Expanded(child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.wb_cloudy,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                Text("43",style: TextStyle(
                                    color: Colors.white,fontWeight: FontWeight.w700,
                                ),),
                                Text("Package Delivered",style: TextStyle(
                                  color: Colors.white,fontSize: 10,
                                ),)
                              ],
                            ),),
                            VerticalDivider(color: Colors.white),
                            Expanded(child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.storage,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                Text("12,345",style: TextStyle(
                                    color: Colors.white,fontSize:15,fontWeight: FontWeight.w700,
                                ),),
                                Text("Express Points",style: TextStyle(
                                    color: Colors.white,fontSize: 10,
                                ),)
                              ],
                            ),),
                          ],
                        ),
                        SizedBox(height: 30.0),
                        _buildDivider(),
                      ],
                    ),

                   Container(
                
//                   color: Colors.white,
                     child: Column(
                       children: <Widget>[
                         new ListTile(
                           leading:Icon(Icons.notifications_active ),
                           title: new Text("notifications".toUpperCase()),
                           trailing:Chip(
                             label: Text('5'),
                             backgroundColor: Colors.green,
                           ),

                         ), new ListTile(
                           leading:Icon(Icons.person_pin ),
                           title: new Text("FAQ".toUpperCase()),

                         ), new ListTile(
                           leading:Icon(Icons.thumbs_up_down ),
                           title: new Text("Terms".toUpperCase()),

                         ), new ListTile(
                           leading:Icon(Icons.border_color ),
                           title: new Text("Privacy".toUpperCase()),


                         ),new ListTile(
                           leading:Icon(Icons.exit_to_app ),
                           title: new Text("logout".toUpperCase()),

                         ),
//                            _buildRow(Icons.notifications_active, "Notifications"),
//
//                            _buildRow(Icons.person_pin, "FAQ"),
//
//                            _buildRow(Icons.thumbs_up_down, "Terms"),
//
//                            _buildRow(Icons.border_color, "Privacy"),
//
//                            _buildRow(Icons.exit_to_app, "Logout"),
                          ],
                        ),
                   ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Container(

                  // color: Colors.white,
                       child: Row(
                         children: <Widget>[
                           Flexible(
                             child: Column(
                             children: <Widget>[
                               Icon(
                                 Icons.pin_drop,
                                 color: Colors.white,
                                 size: 30.0,
                               ),
                               Text("MAP TYPE",style: TextStyle(
                                 color: Colors.white,fontSize: 10,
                               ),)
                             ],
                           ),
                           ),
                           SizedBox(width: 30.0),
                           Flexible(
                             child: Column(
                             children: <Widget>[
                               Icon(
                                 Icons.pin_drop,
                                 color: Colors.white,
                                 size: 30.0,
                               ),
                               Text("MAP TYPE",style: TextStyle(
                                 color: Colors.white,fontSize: 10,
                               ),)
                             ],
                           ),
                           ),
                           SizedBox(width: 30.0),
                           Flexible(
                             child: Column(
                             children: <Widget>[
                               Icon(
                                 Icons.pin_drop,
                                 color: Colors.white,
                                 size: 30.0,
                               ),
                               Text("MAP TYPE",style: TextStyle(
                                 color: Colors.white,fontSize: 10,
                               ),)
                             ],
                           ),
                           ),
                           SizedBox(width: 30.0),
                           Flexible(
                             child: Column(
                             children: <Widget>[
                               Icon(
                                 Icons.pin_drop,
                                 color: Colors.white,
                                 size: 30.0,
                               ),
                               Text("MAP TYPE",style: TextStyle(
                                 color: Colors.white,fontSize: 10,
                               ),)
                             ],
                           ),
                           ),

                            ],
                          ),
                   ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Container(

                  // color: Colors.white,
                       child: Row(
                         children: <Widget>[
                           Flexible(
                             child: Row(
                             children: <Widget>[
                               Icon(
                                 Icons.pin_drop,
                                 color: Colors.white,
                                 size: 30.0,
                               ),
                               Text("MAP TYPE",style: TextStyle(
                                 color: Colors.white,fontSize: 10,
                               ),)
                             ],
                           ),
                           )   ,
                           Flexible(
                             child: Row(
                             children: <Widget>[
                               Icon(
                                 Icons.pin_drop,
                                 color: Colors.white,
                                 size: 30.0,
                               ),
                               Text("MAP TYPE",style: TextStyle(
                                 color: Colors.white,fontSize: 10,
                               ),)
                             ],
                           ),
                           )   ,
                           Flexible(
                             child: Row(
                             children: <Widget>[
                               Icon(
                                 Icons.pin_drop,
                                 color: Colors.white,
                                 size: 30.0,
                               ),
                               Text("MAP TYPE",style: TextStyle(
                                 color: Colors.white,fontSize: 10,
                               ),)
                             ],
                           ),
                           ),

                            ],
                          ),
                   ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: Colors.purpleAccent,
    );
  }
  Widget _buildRow(IconData icon, String title) {
    final TextStyle tStyle = TextStyle(color: Colors.purpleAccent, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(children: [
        Icon(
          icon,
          color: Colors.purpleAccent,
        ),
        SizedBox(width: 10.0),
        Text(
          title,
          style: tStyle,
        ),
      ]),
    );
  }

}