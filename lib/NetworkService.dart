import 'package:dio/dio.dart';

import 'Food.dart';

class NetworkService {
  Dio dio = Dio();

  Future<Food> loadFoodRecipe() async {
    var response = await dio.get(
        'https://api.spoonacular.com/recipes/complexSearch?query=pasta&apiKey=3c826e7f1fa24626b3236b841a286ff2');
    return Food.fromJson(response.data);
  }

  Future<Food> searchFood(String txt) async {
    var response = await dio.get(
        'https://api.spoonacular.com/recipes/complexSearch?query=$txt&apiKey=3c826e7f1fa24626b3236b841a286ff2');
    return Food.fromJson(response.data);
  }
}
