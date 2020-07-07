class SqlCart {
  int _id;
  String _des;
  String _image1;
  String _image2;
  String _image3;
  String _weight;
  String _dim;
  String _notes;
  String _name;


  SqlCart( this._des,
  this._image1,this._image2,this._image3, this._weight,
      this._dim,this._notes, this._name);

  SqlCart.map(dynamic obj) {
    this._id = obj['id'];
    this._des = obj['des'];
    this._image1 = obj['image1'];
    this._image2 = obj['image2'];
    this._image3 = obj['image3'];
    this._weight = obj['weight'];

    this._dim = obj['dim'];
    this._notes = obj['notes'];
    this._name = obj['name'];
  }
  int get id => _id;
  String get des => _des;

  String get image1 => _image1;
  String get image2 => _image2;
  String get image3 => _image3;

  String get weight => _weight;
  String get dim => _dim;
  String get notes => _notes;
  String get name => _name;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["des"] = _des;
    map["image1"] = _image1;
     map["image2"] = _image2;
      map["image3"] = _image3;
    map["weight"] = _weight;
    map["dim"] = _dim;
    map["notes"] = _notes;
    map["name"] = _name;

    if (id != null) {
      map["id"] = _id;
    }
    return map;
  }

  SqlCart.fromMap(Map<String, dynamic> map) {
     this._id = map['id'];
     this._des = map['des'];
    this._image1 = map['image1'];
    this._image2 = map['image2'];
    this._image3 = map['image3'];
    this._weight = map['weight'];
    this._dim = map['dim'];
    this._notes = map['notes'];
    this._name = map['name'];
  }


}