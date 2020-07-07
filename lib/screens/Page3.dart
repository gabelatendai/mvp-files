import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 12.0,
      fontWeight: FontWeight.w200,
    );
    TextStyle _statLabelTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 14.0,
      //fontWeight: FontWeight.bold,
    );
    final sizeX = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.80,
            //height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: Colors.black)),
            // padding: EdgeInsets.only(top:20),
            // preferredSize: Size.fromHeight(20.0),
            child: TabBar(
              labelStyle: TextStyle(fontSize: 9.0),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,

              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(10),
                  //     topRight: Radius.circular(10)
                  //     ),
                  color: Colors.black),
              tabs: [
                Tab(text: 'This Week'.toUpperCase()),
                // Spacer(),
                // Divider(color:Colors.red,),

                Tab(
                  text: 'This Month'.toUpperCase(),
                ),

                Tab(
                  text: 'This Year'.toUpperCase(),
                )
              ], // list of tabs
            ),
          ),
          SizedBox(
            height: 10,
            child: Container(
              color: Color(0xFFf5f6f7),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Container(
                  color: Colors.white24,
                  child: Week(),
                ),
//                child: CategoryPage(
//                          cid:  cid, isSubList: true),
//                    ),
                Container(
                  color: Colors.white24,
                  child: Month(),
                ),
                Container(
                  color: Colors.white24,
                  child: Year(),
                ) // class name
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget verticalDivider() {
    return Container(height: 60, width: 2, color: Colors.black);
  }
}

Divider _buildDivider() {
  return Divider(
    color: Colors.black,
  );
}

class Week extends StatelessWidget {
  const Week({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        // padding: EdgeInsets.only(left:20),
        child: Column(children: <Widget>[
      Row(
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          Text(
            "Clear All",
            style: TextStyle(color: Colors.purple),
          ),
          Flexible(fit: FlexFit.tight, child: SizedBox()),
          Icon(Icons.delete_forever),
        ],
      ),
      Expanded(
          child: ListView(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          _history(),
          _buildDivider(),
          SizedBox(
            height: 15,
          ),
          _history(),
          SizedBox(
            height: 15,
          ),
          _buildDivider(),
          SizedBox(
            height: 15,
          ),
          _history(),
          SizedBox(
            height: 15,
          ),
          _buildDivider(),
          SizedBox(
            height: 15,
          ),
          _history(),
          SizedBox(
            height: 15,
          ),
          _buildDivider(),
          SizedBox(
            height: 15,
          ),
          _history(),
          SizedBox(
            height: 15,
          ),
          _buildDivider(),
          SizedBox(
            height: 15,
          ),
          _history(),
          SizedBox(
            height: 15,
          ),
          _buildDivider(),
          SizedBox(
            height: 15,
          ),
          _history(),
          SizedBox(
            height: 15,
          ),
          _buildDivider(),
        ],
      ))
    ]
            // child:Center(child: Text("page 3"),)
            ));
  }

  _history() {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 12.0,
      fontWeight: FontWeight.w200,
    );
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
            Text(
              "Order ID".toUpperCase(),
              style: bioTextStyle,
              textAlign: TextAlign.start,
            ),
            Text(
              "123abcd456".toUpperCase(),
            ),
          ]),
          Column(children: <Widget>[
            Text(
              "Date".toUpperCase(),
              style: bioTextStyle,
            ),
            Text("09/09/19".toUpperCase()),
          ]),
          Column(children: <Widget>[
            Text("Total".toUpperCase(), style: bioTextStyle),
            Text("Aed 12,345.67".toUpperCase()),
          ]),
        ]);
  }
}

class Month extends StatelessWidget {
  const Month({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        // padding: EdgeInsets.only(left:20),
        child: Column(children: <Widget>[
      Row(
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          Text(
            "Clear All",
            style: TextStyle(color: Colors.purple),
          ),
          Flexible(fit: FlexFit.tight, child: SizedBox()),
          Icon(Icons.delete_forever),
        ],
      ),
      Expanded(
          child: ListView(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          _history(),
          _buildDivider(),
          SizedBox(
            height: 15,
          ),
          _history(),
          SizedBox(
            height: 15,
          ),
          _buildDivider(),
          SizedBox(
            height: 15,
          ),
          _history(),
          SizedBox(
            height: 15,
          ),
          _buildDivider(),
          SizedBox(
            height: 15,
          ),
          _history(),
          SizedBox(
            height: 15,
          ),
          _buildDivider(),
          SizedBox(
            height: 15,
          ),
          _history(),
          SizedBox(
            height: 15,
          ),
          _buildDivider(),
          SizedBox(
            height: 15,
          ),
          _history(),
          SizedBox(
            height: 15,
          ),
          _buildDivider(),
          SizedBox(
            height: 15,
          ),
          _history(),
          SizedBox(
            height: 15,
          ),
          _buildDivider(),
        ],
      ))
    ]
            // child:Center(child: Text("page 3"),)
            ));
  }

  _history() {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 12.0,
      fontWeight: FontWeight.w200,
    );
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(children: <Widget>[
            Text(
              "Order ID".toUpperCase(),
              style: bioTextStyle,
              textAlign: TextAlign.start,
            ),
            Text(
              "123abcd456".toUpperCase(),
            ),
          ]),
          Column(children: <Widget>[
            Text(
              "Date".toUpperCase(),
              style: bioTextStyle,
            ),
            Text("09/09/19".toUpperCase()),
          ]),
          Column(children: <Widget>[
            Text("Total".toUpperCase(), style: bioTextStyle),
            Text("Aed 12,345.67".toUpperCase()),
          ]),
        ]);
  }
}

class Year extends StatelessWidget {
  const Year({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        // padding: EdgeInsets.only(left:20),
        child: Column(children: <Widget>[
      Row(
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          Text(
            "Clear All",
            style: TextStyle(color: Colors.purple),
          ),
          Flexible(fit: FlexFit.tight, child: SizedBox()),
          Icon(Icons.delete_forever),
        ],
      ),
      Expanded(
          child: ListView(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          _history(),
          _buildDivider(),
          SizedBox(
            height: 15,
          ),
          _history(),
          SizedBox(
            height: 15,
          ),
          _buildDivider(),
          SizedBox(
            height: 15,
          ),
          _history(),
          SizedBox(
            height: 15,
          ),
          _buildDivider(),
          SizedBox(
            height: 15,
          ),
          _history(),
          SizedBox(
            height: 15,
          ),
          _buildDivider(),
          SizedBox(
            height: 15,
          ),
          _history(),
          SizedBox(
            height: 15,
          ),
          _buildDivider(),
          SizedBox(
            height: 15,
          ),
          _history(),
          SizedBox(
            height: 15,
          ),
          _buildDivider(),
          SizedBox(
            height: 15,
          ),
          _history(),
          SizedBox(
            height: 15,
          ),
          _buildDivider(),
        ],
      ))
    ]
            // child:Center(child: Text("page 3"),)
            ));
  }

  _history() {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 12.0,
      fontWeight: FontWeight.w200,
    );
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(children: <Widget>[
            Text(
              "Order ID".toUpperCase(),
              style: bioTextStyle,
              textAlign: TextAlign.start,
            ),
            Text(
              "123abcd456".toUpperCase(),
            ),
          ]),
          Column(children: <Widget>[
            Text(
              "Date".toUpperCase(),
              style: bioTextStyle,
            ),
            Text("09/09/19".toUpperCase()),
          ]),
          Column(children: <Widget>[
            Text("Total".toUpperCase(), style: bioTextStyle),
            Text("Aed 12,345.67".toUpperCase()),
          ]),
        ]);
  }
}
