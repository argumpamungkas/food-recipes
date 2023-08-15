class FilterFood {
  String id;
  String mealName;
  String mealThumb;

  FilterFood({
    required this.id,
    required this.mealName,
    required this.mealThumb,
  });

  factory FilterFood.fromJson(Map<String, dynamic> json) => FilterFood(
        id: json["strMeal"] ?? "",
        mealName: json["strMeal"] ?? "",
        mealThumb: json["strMealThumb"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mealName": mealName,
        "mealThumb": mealThumb,
      };
}
