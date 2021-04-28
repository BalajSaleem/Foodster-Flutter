class IngredientBase {
  String name;
  Null imgUrl;
  Null nutrition;
  Null estimatedPrice;

  IngredientBase({this.name, this.imgUrl, this.nutrition, this.estimatedPrice});

  IngredientBase.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imgUrl = json['imgUrl'];
    nutrition = json['nutrition'];
    estimatedPrice = json['estimatedPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['imgUrl'] = this.imgUrl;
    data['nutrition'] = this.nutrition;
    data['estimatedPrice'] = this.estimatedPrice;
    return data;
  }
}
