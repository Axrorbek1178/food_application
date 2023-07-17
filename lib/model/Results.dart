class Results {
  Results({
      this.id, 
      this.title, 
      this.image, 
      this.imageType,});

  Results.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageType = json['imageType'];
  }
  int id;
  String title;
  String image;
  String imageType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['imageType'] = imageType;
    return map;
  }

}