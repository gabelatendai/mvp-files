import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvp/components/AppBarWidget.dart';

//class Shipping extends StatelessWidget {

class Shipping extends StatefulWidget {
  @override
  _ShippingState createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appBarWidget(context),
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
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
                        ]))]),

          Transform.translate(
            offset: Offset(14.08, 87.0),
            child: SvgPicture.string(
              _svg_6w4v18,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(351.0, 88.0),
            child: Container(
              width: 51.0,
              height: 151.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                  bottomLeft: Radius.circular(5.0),
                ),
                color: const Color(0xff8a0d60),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(32.0, 103.0),
            child: Text(
              'shipping ID',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 12,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(35.0, 214.0),
            child: Text(
              'fafafa',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(287.0, 102.0),
            child: Text(
              '48 mins',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 13,
                color: const Color(0xffec0d0d),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(2.0, 0.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(32.0, 141.0),
                  child: Text(
                    'From',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 12,
                      color: const Color(0xff707070),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(312.0, 149.0),
                  child: Text(
                    'To',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 12,
                      color: const Color(0xff707070),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(2.0, 34.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(30.0, 138.0),
                  child: Text(
                    'Al Wahda Mall',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 13,
                      color: const Color(0xff707070),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(226.5, 138.5),
                  child: Text(
                    'My Freaken House',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 12,
                      color: const Color(0xff707070),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Transform(
            transform: Matrix4(
                0.017452,
                0.999848,
                0.0,
                0.0,
                -0.999848,
                0.017452,
                0.0,
                0.0,
                0.0,
                0.0,
                1.0,
                0.0,
                391.32,
                134.88,
                0.0,
                1.0),
            child: InkWell(
              child: Text(
                'cancel',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 21,
                  color: const Color(0xffefe3e3),
                ),
                textAlign: TextAlign.left,
              ),
              onTap: ()=>{
                print("clicked"),
              }
              ,
            ),
          ),
          Transform.translate(
            offset: Offset(96.0, 102.0),
            child: Text(
              '123456798',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 13,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(224.0, 103.0),
            child: Text(
              'approx',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 12,
                color: const Color(0xffb21818),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(207.0, 199.0),
            child: Container(
              width: 127.0,
              height: 32.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xff746c6c),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(224.0, 204.0),
            child: Text(
              'Shipping Details',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 13,
                color: const Color(0xffe4d9d9),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
  Widget verticalDivider() {
    return Container(height: 60, width: 2, color: Colors.black);
  }
}


const String _svg_6w4v18 =
    '<svg viewBox="14.1 87.0 389.0 151.0" ><path transform="translate(14.08, 87.0)" d="M 17.52384948730469 0 L 371.5055847167969 0 C 381.1837768554688 0 389.0294799804688 6.715728759765625 389.0294799804688 15 L 389.0294799804688 136 C 389.0294799804688 144.2842712402344 381.1837768554688 151 371.5055847167969 151 L 17.52384948730469 151 C 7.845695018768311 151 0 144.2842712402344 0 136 L 0 15 C 0 6.715728759765625 7.845695018768311 0 17.52384948730469 0 Z" fill="#e2efeb" fill-opacity="0.85" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
