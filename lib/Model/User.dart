class User {
  String sId;
  String email;
  String password;
  int iV;
  String token;

  User({this.sId, this.email, this.password, this.iV, this.token});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    iV = json['__v'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['__v'] = this.iV;
    data['token'] = this.token;
    return data;
  }
}