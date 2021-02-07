class User {
  String sId;
  String email;
  String password;
  String gender;
  double height;
  double weight;
  int iV;
  String token;

  User({this.sId, this.email, this.password, this.iV, this.token});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
    iV = json['__v'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['gender'] = this.gender;
    data['__v'] = this.iV;
    data['token'] = this.token;
    return data;
  }
}