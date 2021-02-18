class Measure {
  String unit;
  double mag;

  Measure({this.unit, this.mag});

  Measure.fromJson(Map<String, dynamic> json) {
    unit = json['type'];
    mag = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.unit;
    data['amount'] = this.mag;
    return data;
  }
}