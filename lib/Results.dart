import 'Nutrition.dart';

class Results {
  Results({
      this.id, 
      this.title, 
      this.image, 
      this.imageType, 
      this.nutrition,});

  Results.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageType = json['imageType'];
    nutrition = json['nutrition'] != null ? Nutrition.fromJson(json['nutrition']) : null;
  }
  int? id;
  String? title;
  String? image;
  String? imageType;
  Nutrition? nutrition;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['imageType'] = imageType;
    if (nutrition != null) {
      map['nutrition'] = nutrition!.toJson();
    }
    return map;
  }

}