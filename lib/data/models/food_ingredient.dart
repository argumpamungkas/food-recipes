class FoodIngredient {
  String id;
  String ingredient;

  FoodIngredient({
    required this.id,
    required this.ingredient,
  });

  factory FoodIngredient.fromJson(Map<String, dynamic> json) => FoodIngredient(
        id: json["idIngredient"] ?? "",
        ingredient: json["strIngredient"] ?? "",
      );

  Map<String, dynamic> tojson() => {
        "id": id,
        "ingredient": ingredient,
      };
}
