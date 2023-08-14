import 'dart:convert';
import 'dart:io';

import 'package:food_recipes/data/models/all_categories_food.dart';
import 'package:food_recipes/data/models/random_food.dart';
import 'package:http/http.dart' as http;

import '../const/api_const.dart';

class MealRepository {
  Future<RandomFood> getRandomFood() async {
    Uri urlParse = Uri.parse("${ApiConst.baseUrl}/random.php");
    var response = await http.get(urlParse);

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> meals =
            jsonDecode(response.body)["meals"][0] as Map<String, dynamic>;

        RandomFood randomFood = RandomFood.fromJson(meals);
        return randomFood;
      } else {
        throw Exception("Failed to Load data");
      }
    } on SocketException {
      throw Exception("Check Internet Connection");
    }
  }

  Future<List<AllCategoriesFood>> getAllCatgeoriesFood() async {
    Uri urlParse = Uri.parse("${ApiConst.baseUrl}/categories.php");
    var response = await http.get(urlParse);

    try {
      if (response.statusCode == 200) {
        List allCategories = jsonDecode(response.body)["categories"];

        if (allCategories.isEmpty) {
          return [];
        } else {
          return allCategories
              .map((e) => AllCategoriesFood.fromJson(e))
              .toList();
        }
      } else {
        throw Exception("Failed to Load data");
      }
    } on SocketException {
      throw Exception("Check Internet Connection");
    }
  }
}
