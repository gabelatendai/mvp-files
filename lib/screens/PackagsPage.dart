import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mvp/components/AppBarWidget.dart';
import 'package:mvp/components/drawerwidget.dart';
import 'package:mvp/models/imagemodel.dart';
import 'package:mvp/models/packagesModel.dart';
import 'package:mvp/screens/Utility.dart';
import 'package:mvp/utils/sqlite_helper.dart';
import 'package:sqflite/sqflite.dart';

class PackagesPage extends StatefulWidget {
  @override
  _PackagesPageState createState() => _PackagesPageState();
}

var primaryColor = Color(0xFFA43984);
List _cartList;
int total = 0;
int pc;
var dbHelper = new Helper();

class _PackagesPageState extends State<PackagesPage> {
  Future<List<SqlCart>> fetchEmployeesFromDatabase() async {
    var dbHelper = new Helper();

    Future<List<SqlCart>> employees = dbHelper.getEmployees();
    return employees;
  }

  Uint8List _bytesImage;
  File _image;
  String base64Image;

  Future getImage() async {
    var image2 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    List<int> imageBytes = image2.readAsBytesSync();
    print(imageBytes);
    base64Image = base64Encode(imageBytes);
    print('string is');
    print(base64Image);
    print("You selected gallery image : " + image2.path);

    _bytesImage = Base64Decoder().convert(base64Image);

    setState(() {
      _image = image2;
    });
  }

  static Database _db;

  _getCart() async {
    _cartList = await dbHelper.getAllSqlCarts();
    for (int i = 0; i < _cartList.length; i++) {
      SqlCart cart = SqlCart.map(_cartList[i]);
      var p = int.parse(SqlCart.fromMap(_cartList[i]).notes);
      //var q = int.parse(SqlCart.fromMap(_cartList[i]).qnty);
      // var subtotal = p * q;
      total += p;
      print("hshs");
//      print("Product Name: ${cart.name },price: ${cart.dim }, Product Type: ${cart.notes}");
    }
  }

  deleteCart(cid) async {
    int userDeleted = await dbHelper.deleteSqlCart(cid);
    print("Delete User:  $userDeleted");
    print("Delete Usert:  $cid");
    setState(() {
      _getCart();
//      fetchEmployeesFromDatabase();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _getCart();

      fetchEmployeesFromDatabase();
      // print(dbHelper.getCount().toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(context),
        backgroundColor: Colors.grey.shade100,
        drawer: DrawerWidget(),
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 50)),
                  Row(
                    //padding: EdgeInsets.symmetric(horizontal:16.0, vertical: 30.0),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(height: 50),
                      Row(
                        children: <Widget>[
                          Text(
                            "No. of packages:",
                            style: TextStyle(color: Colors.grey),
                            // style: label,
                          ),
                          Text(
                            "2",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text("Total Weight:", style: TextStyle(color: Colors.grey)
                            // style: label,
                          ),
                          Text(
                            "101 kg",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                            // style: label,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Icon(Icons.delete)
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: _cartList == null
                        ? Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "No Package\n added yet",
                              style: TextStyle(
                                color: Colors.black26,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Image.asset("assets/pkg.jpg"),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Add Package".toUpperCase(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'You can add several pacakage and choose',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "which package to drop to each",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "derop of lacations ",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ))
                    // )
                        : new ListView.builder(
                      itemCount: _cartList.length,
                      itemBuilder: (_, int index) {
                        SqlCart bunners = SqlCart.fromMap(_cartList[index]);
                      String DecoImage=SqlCart.fromMap(_cartList[index]).image1;
                        _bytesImage = Base64Decoder().convert(DecoImage);
//                        Uint8List bytes = base64Decode(base64Image);

                        //     Utility.imageFromBase64String(bunners.image1);
                        return InkWell(
                          child: Card(
                            color: Colors.grey[200],
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 70.0,
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: MemoryImage(_bytesImage),
                                          //Image.memory(_bytesImage),
                                          //Utility.imageFromBase64String(bunners.image1),
//                                          AssetImage("assets/pkg.webp"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(10.0)),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "${bunners.name}",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        "${bunners.des}",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 5.0),
                                      Container(
                                        height: 25.0,
                                        width: 120.0,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text("Weight:",
                                                    style: TextStyle(
                                                        color:
                                                        Color(0xFFD3D3D3),
                                                        fontWeight:
                                                        FontWeight.bold)),
                                                SizedBox(
                                                  width: 5.0,
                                                ),
                                                Text(
                                                  "${bunners.weight} kg",
                                                  style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    color: Color(0xFFD3D3D3),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      print(bunners.name);
                                      print(bunners.id);
                                      //deleteCart(bunners.id);
                                    },
                                    child: Icon(
                                      Icons.adjust,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onLongPress: () {},
                        );
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                            elevation: 5.0,
                            height: 50.0,
                            minWidth: 180,
                            color: Color(0xFF2a8385),
                            child: Text(
                              "Add Package".toUpperCase(),
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CustomDialogw());
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  buildAddToRow(),
                ]
              //  bottomNavigationBar: _buildTotalContainer(),
            )));
  }

  Widget buildAddToRow() {
    return Container(
        margin: EdgeInsets.only(left: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                color: Colors.grey,
                elevation: 0,
                onPressed: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) => ShipmentPage()),
//                  );
                  //  addToCart(id);
                  print('selectedType');
                  //  print(selectedSize);
                },
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Cancel".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                color: primaryColor,
                elevation: 0,
                onPressed: () {
                  // getImage();
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) => MyImage()),
//                  );
                  print('user_id');
                },
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Next".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class CustomDialogw extends StatefulWidget {
  CustomDialogw({Key key}) : super(key: key);

  @override
  _CustomDialogwState createState() => _CustomDialogwState();
}

class _CustomDialogwState extends State<CustomDialogw> {
  @override
  var im1;
  var im2;
  var im3;
  var image3 = "";
  // Future<File> imageFile;
  Image imageFromPreferences;
  List<Object> images = List<Object>();
  Future<File> _imageFile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      _getCart();
    });
  }

  Widget buildGridView2() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(images.length, (index) {
        if (images[index] is ImageUploadModel) {
          ImageUploadModel uploadModel = images[index];

          return Card(
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: <Widget>[
                Text(uploadModel.imageUrl),
                Image.file(
                  uploadModel.imageFile,
                  width: 300,
                  height: 300,
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: InkWell(
                    child: Icon(
                      Icons.remove_circle,
                      size: 20,
                      color: Colors.red,
                    ),
                    onTap: () {
                      setState(() {
                        images.replaceRange(index, index + 1, ['Add Image']);
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Card(
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _onAddImageClick(index);
              },
            ),
          );
        }
      }),
    );
  }

  bool _validate = false;
  void getFileImage(int index) async {
    _imageFile.then((file) async {
      setState(() {
        ImageUploadModel imageUpload = new ImageUploadModel();
        imageUpload.isUploaded = false;
        imageUpload.uploading = false;
        imageUpload.imageFile = file;
        imageUpload.imageUrl = '';
        images.replaceRange(index, index + 1, [imageUpload]);
        if (index == 0) {
          im1 = imageUpload.imageFile;
        }
        if (index == 1) {
          im2 = imageUpload.imageFile;
        }
        if (index == 2) {
          im3 = imageUpload.imageFile;
        }
      });
    });
  }

  Future _onAddImageClick(int index) async {
    setState(() {
      _imageFile = ImagePicker.pickImage(source: ImageSource.gallery);
      getFileImage(index);
    });
  }

  _getCart() async {
    _cartList = await dbHelper.getAllSqlCarts();
    for (int i = 0; i < _cartList.length; i++) {
      SqlCart cart = SqlCart.map(_cartList[i]);
      var p = int.parse(SqlCart.fromMap(_cartList[i]).notes);
      total += p;
      //print("hshs");
//      print("Product Name: ${cart.name },price: ${cart.dim }, Product Type: ${cart.notes}");
    }
  }

  TextEditingController _controllername = new TextEditingController();
  TextEditingController _controllerdes = new TextEditingController();
  TextEditingController _controllerdim = new TextEditingController();
  TextEditingController _controllerweight = new TextEditingController();
  TextEditingController _controllernotes = new TextEditingController();
  _add() async {
    String imgString1 = Utility.base64String(im1.readAsBytesSync());
    String imgString2 = Utility.base64String(im2.readAsBytesSync());
    String imgString3 = Utility.base64String(im3.readAsBytesSync());
    var db = new Helper();
    await db.saveSqlCart(new SqlCart(
        "${_controllerdes.text}",
        "${imgString1}",
        "${imgString2}",
        "${imgString3}",
        "${_controllerweight.text}",
        "${_controllerdim.text}",
        "${_controllernotes.text}",
        "${_controllername.text}"));
    setState(() {
      _getCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  final _formKey = GlobalKey<FormState>();
  Widget dialogContent(BuildContext context) {
    return Container(
      width: 1000,
      // margin: EdgeInsets.only(top: 5),
      child: Stack(
        children: <Widget>[
          Container(
            // width: 1000,
              padding: EdgeInsets.only(
                top: 18.0,
              ),
              margin: EdgeInsets.only(top: 80.0, right: 8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 0.0,
                      offset: Offset(0.0, 0.0),
                    ),
                    //#60003F
                    //#901c6c
                  ]),
              child: ListView(
                children: <Widget>[
                  _imageFile == null
                      ? Container(
                      margin: const EdgeInsets.only(
                          left: 40.0, right: 40, top: 30, bottom: 15),
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors
                              .grey, //                   <--- border color
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                            10.0) //         <--- border radius here
                        ),
                      ),
                      //       <--- BoxDecoration here

                      child: Column(children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          child: Text(
                            "Click here To add image".toUpperCase(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            _onAddImageClick(0);
                            // getImage();
                          },
                        ),
                      ]))
                      : Container(
                    height: 130,
                    child: buildGridView2(),
                  ),
                  Column(children: <Widget>[
                    Text(
                      'Add More Images',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0),
                    ),
                    Text('You can add up to 3 images'),
                  ]),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              autofocus: true,
                              controller: _controllername,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Package Name is empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Package Name',
                                errorText: _validate
                                    ? 'Package Name Can\'t Be Empty'
                                    : null,
                              ),
                              // onSaved: (input) => data['name'] = input,
                            ),
                            TextFormField(
                              controller: _controllerdes,
                              decoration: InputDecoration(
                                labelText: 'Description',
                                errorText: _validate
                                    ? 'Description Can\'t Be Empty'
                                    : null,
                              ),

                              // onSaved: (input) => data['email'] = input,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: TextFormField(
                                        controller: _controllerdim,
                                        decoration: InputDecoration(
                                          labelText: 'Dimensions',
                                          errorText: _validate
                                              ? 'Dimensions Can\'t Be Empty'
                                              : null,
                                        ))),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    child: TextFormField(
                                        autofocus: true,
                                        controller: _controllerweight,
                                        decoration: InputDecoration(
                                          labelText: 'Weight',
                                          errorText: _validate
                                              ? 'Weight Can\'t Be Empty'
                                              : null,
                                        )))
                              ],
                            ),
                            TextFormField(
                              controller: _controllernotes,

                              decoration: InputDecoration(
                                labelText: 'Add Notes',
                                errorText:
                                _validate ? 'Notes Can\'t Be Empty' : null,
                              ),
                              // onSaved: (input) => data['age'] = input,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ButtonTheme(
                              minWidth: 250.0,
                              height: 50.0,
                              //  buttonColor: Colors.pink[800],
                              buttonColor: Color(0xFFA43984),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                onPressed: () {
                                  _add();
                                  // print(im1);
                                  // print(im2);
                                  // print(im3);
                                  Navigator.pop(context);
                                  // if (_formKey.currentState.validate()) {
                                  //   print('im1');
                                  // }
                                  // setState(() {
                                  //   _controllername.text.isEmpty
                                  //       ? _validate = true
                                  //       : _validate = false;
                                  //   _controllerdes.text.isEmpty
                                  //       ? _validate = true
                                  //       : _validate = false;
                                  //   _controllerdim.text.isEmpty
                                  //       ? _validate = true
                                  //       : _validate = false;
                                  //   _controllerweight.text.isEmpty
                                  //       ? _validate = true
                                  //       : _validate = false;
                                  //   _controllernotes.text.isEmpty
                                  //       ? _validate = true
                                  //       : _validate = false;
                                  // });
                                },
                                child: Text(
                                  "ADD PACKAGE ".toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    // fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              )),
          Positioned(
            //right: 0.0,
            right: 5,
            top: 73,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 14.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    // Icons.cloud_circle
                      Icons.close,
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
