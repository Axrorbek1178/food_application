class Nutrients {
  Nutrients({
      this.name, 
      this.amount, 
      this.unit,});

  Nutrients.fromJson(dynamic json) {
    name = json['name'];
    amount = json['amount'];
    unit = json['unit'];
  }
  String? name;
  double? amount;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['amount'] = amount;
    map['unit'] = unit;
    return map;
  }

}