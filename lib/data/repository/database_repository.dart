import 'package:food_recipes/data/db/favouriteDB.dart';
import 'package:food_recipes/data/models/detail_food.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo {
  DatabaseManager dbManager = DatabaseManager.instance;

  Future<void> addFavourite(DetailFood detailFood) async {
    Database db = await dbManager.db;

    var result = await db.insert(
      "favourite",
      {
        "id_meal": detailFood.id,
        "meal_name": detailFood.mealName,
        "meal_thumb": detailFood.mealThumb,
      },
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<Map<String, dynamic>>> getAllFavourite() async {
    Database db = await dbManager.db;

    List<Map<String, dynamic>> allFavourite = await db.query("favourite");
    if (allFavourite.isEmpty) {
      return [];
    } else {
      return allFavourite;
    }
  }

  Future<Map<String, dynamic>?> getFoundFavourite(String idMeal) async {
    Database db = await dbManager.db;

    List<Map<String, dynamic>> foundFavourite = await db.query(
      "favourite",
      where: "id_meal = $idMeal",
    );
    if (foundFavourite.isEmpty) {
      return null;
    } else {
      return foundFavourite[0];
    }
  }

  Future<void> deleteFavouriteFood(String idMeal) async {
    Database db = await dbManager.db;

    await db.delete("favourite", where: "id_meal = $idMeal");
  }
}
