import 'Results.dart';

class FoodSearch {
  FoodSearch({
      this.results, 
      this.offset, 
      this.number, 
      this.totalResults,});

  FoodSearch.fromJson(dynamic json) {
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
    offset = json['offset'];
    number = json['number'];
    totalResults = json['totalResults'];
  }
  List<Results> results;
  int offset;
  int number;
  int totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (results != null) {
      map['results'] = results.map((v) => v.toJson()).toList();
    }
    map['offset'] = offset;
    map['number'] = number;
    map['totalResults'] = totalResults;
    return map;
  }

}