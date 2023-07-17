import 'Nutrients.dart';

class Nutrition {
  Nutrition({
      this.nutrients,});

  Nutrition.fromJson(dynamic json) {
    if (json['nutrients'] != null) {
      nutrients = [];
      json['nutrients'].forEach((v) {
        nutrients!.add(Nutrients.fromJson(v));
      });
    }
  }
  List<Nutrients>? nutrients;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (nutrients != null) {
      map['nutrients'] = nutrients!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}