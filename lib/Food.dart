import 'Results.dart';

class Food {
  Food({
      this.results, 
      this.offset, 
      this.number, 
      this.totalResults,});

  Food.fromJson(dynamic json) {
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    offset = json['offset'];
    number = json['number'];
    totalResults = json['totalResults'];
  }
  List<Results>? results;
  int? offset;
  int? number;
  int? totalResults;


}