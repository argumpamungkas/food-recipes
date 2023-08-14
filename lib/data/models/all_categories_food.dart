class AllCategoriesFood {
  String id;
  String category;
  String thumb;

  AllCategoriesFood({
    required this.id,
    required this.category,
    required this.thumb,
  });

  factory AllCategoriesFood.fromJson(Map<String, dynamic> json) =>
      AllCategoriesFood(
        id: json["idCategory"] ?? "",
        category: json["strCategory"] ?? "",
        thumb: json["strCategoryThumb"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "thumb": thumb,
      };
}
