class RandomFood {
  String id;
  String nameMeal;
  String mealCategory;
  String mealArea;
  String mealThumb;
  String mealTags;

  RandomFood({
    required this.id,
    required this.nameMeal,
    required this.mealCategory,
    required this.mealArea,
    required this.mealThumb,
    required this.mealTags,
  });

  factory RandomFood.fromJson(Map<String, dynamic> json) => RandomFood(
        id: json["idMeal"] ?? "",
        nameMeal: json["strMeal"] ?? "",
        mealCategory: json["strCategory"] ?? "",
        mealArea: json["strArea"] ?? "",
        mealThumb: json["strMealThumb"] ?? "",
        mealTags: json["strTags"] ?? "-",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameMeal": nameMeal,
        "mealCategory": mealCategory,
        "mealArea": mealArea,
        "mealThumb": mealThumb,
        "mealTags": mealTags,
      };
}
