class Measure {
  String unit;
  double mag;

  Measure({this.unit, this.mag});

  Measure.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    mag =  json['mag'] != null ? (json['mag']).toDouble(): null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['mag'] = this.mag;
    return data;
  }
}