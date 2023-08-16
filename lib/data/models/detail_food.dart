class DetailFood {
  String id;
  String mealName;
  String mealCategory;
  String mealArea;
  String mealThumb;
  String mealTags;
  String mealIntructions;
  String mealYoutube;
  String mealIngredient1;
  String mealIngredient2;
  String mealIngredient3;
  String mealIngredient4;
  String mealIngredient5;
  String mealIngredient6;
  String mealIngredient7;
  String mealIngredient8;
  String mealIngredient9;
  String mealIngredient10;
  String mealIngredient11;
  String mealIngredient12;
  String mealIngredient13;
  String mealIngredient14;
  String mealIngredient15;
  String mealIngredient16;
  String mealIngredient17;
  String mealIngredient18;
  String mealIngredient19;
  String mealIngredient20;
  String mealMeasure1;
  String mealMeasure2;
  String mealMeasure3;
  String mealMeasure4;
  String mealMeasure5;
  String mealMeasure6;
  String mealMeasure7;
  String mealMeasure8;
  String mealMeasure9;
  String mealMeasure10;
  String mealMeasure11;
  String mealMeasure12;
  String mealMeasure13;
  String mealMeasure14;
  String mealMeasure15;
  String mealMeasure16;
  String mealMeasure17;
  String mealMeasure18;
  String mealMeasure19;
  String mealMeasure20;

  DetailFood({
    required this.id,
    required this.mealName,
    required this.mealCategory,
    required this.mealArea,
    required this.mealThumb,
    required this.mealTags,
    required this.mealIntructions,
    required this.mealYoutube,
    required this.mealIngredient1,
    required this.mealIngredient2,
    required this.mealIngredient3,
    required this.mealIngredient4,
    required this.mealIngredient5,
    required this.mealIngredient6,
    required this.mealIngredient7,
    required this.mealIngredient8,
    required this.mealIngredient9,
    required this.mealIngredient10,
    required this.mealIngredient11,
    required this.mealIngredient12,
    required this.mealIngredient13,
    required this.mealIngredient14,
    required this.mealIngredient15,
    required this.mealIngredient16,
    required this.mealIngredient17,
    required this.mealIngredient18,
    required this.mealIngredient19,
    required this.mealIngredient20,
    required this.mealMeasure1,
    required this.mealMeasure2,
    required this.mealMeasure3,
    required this.mealMeasure4,
    required this.mealMeasure5,
    required this.mealMeasure6,
    required this.mealMeasure7,
    required this.mealMeasure8,
    required this.mealMeasure9,
    required this.mealMeasure10,
    required this.mealMeasure11,
    required this.mealMeasure12,
    required this.mealMeasure13,
    required this.mealMeasure14,
    required this.mealMeasure15,
    required this.mealMeasure16,
    required this.mealMeasure17,
    required this.mealMeasure18,
    required this.mealMeasure19,
    required this.mealMeasure20,
  });

  factory DetailFood.fromJson(Map<String, dynamic> json) => DetailFood(
        id: json["idMeal"] ?? "",
        mealName: json["strMeal"] ?? "",
        mealCategory: json["strCategory"] ?? "",
        mealArea: json["strArea"] ?? "",
        mealThumb: json["strMealThumb"] ?? "",
        mealTags: json["strTags"] ?? "-",
        mealIntructions: json["strInstructions"] ?? "",
        mealYoutube: json["strYoutube"] ?? "",
        mealIngredient1: json["strIngredient1"] ?? "",
        mealIngredient2: json["strIngredient2"] ?? "",
        mealIngredient3: json["strIngredient3"] ?? "",
        mealIngredient4: json["strIngredient4"] ?? "",
        mealIngredient5: json["strIngredient5"] ?? "",
        mealIngredient6: json["strIngredient6"] ?? "",
        mealIngredient7: json["strIngredient7"] ?? "",
        mealIngredient8: json["strIngredient8"] ?? "",
        mealIngredient9: json["strIngredient9"] ?? "",
        mealIngredient10: json["strIngredient10"] ?? "",
        mealIngredient11: json["strIngredient11"] ?? "",
        mealIngredient12: json["strIngredient12"] ?? "",
        mealIngredient13: json["strIngredient13"] ?? "",
        mealIngredient14: json["strIngredient14"] ?? "",
        mealIngredient15: json["strIngredient15"] ?? "",
        mealIngredient16: json["strIngredient16"] ?? "",
        mealIngredient17: json["strIngredient17"] ?? "",
        mealIngredient18: json["strIngredient18"] ?? "",
        mealIngredient19: json["strIngredient19"] ?? "",
        mealIngredient20: json["strIngredient20"] ?? "",
        mealMeasure1: json["strMeasure1"] ?? "",
        mealMeasure2: json["strMeasure2"] ?? "",
        mealMeasure3: json["strMeasure3"] ?? "",
        mealMeasure4: json["strMeasure4"] ?? "",
        mealMeasure5: json["strMeasure5"] ?? "",
        mealMeasure6: json["strMeasure6"] ?? "",
        mealMeasure7: json["strMeasure7"] ?? "",
        mealMeasure8: json["strMeasure8"] ?? "",
        mealMeasure9: json["strMeasure9"] ?? "",
        mealMeasure10: json["strMeasure10"] ?? "",
        mealMeasure11: json["strMeasure11"] ?? "",
        mealMeasure12: json["strMeasure12"] ?? "",
        mealMeasure13: json["strMeasure13"] ?? "",
        mealMeasure14: json["strMeasure14"] ?? "",
        mealMeasure15: json["strMeasure15"] ?? "",
        mealMeasure16: json["strMeasure16"] ?? "",
        mealMeasure17: json["strMeasure17"] ?? "",
        mealMeasure18: json["strMeasure18"] ?? "",
        mealMeasure19: json["strMeasure19"] ?? "",
        mealMeasure20: json["strMeasure20"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mealName": mealName,
        "mealCategory": mealCategory,
        "mealArea": mealArea,
        "mealThumb": mealThumb,
        "mealTags": mealTags,
        "mealIntructions": mealIntructions,
        "mealIngredient1": mealIngredient1,
        "mealIngredient2": mealIngredient2,
        "mealIngredient3": mealIngredient3,
        "mealIngredient4": mealIngredient4,
        "mealIngredient5": mealIngredient5,
        "mealIngredient6": mealIngredient6,
        "mealIngredient7": mealIngredient7,
        "mealIngredient8": mealIngredient8,
        "mealIngredient9": mealIngredient9,
        "mealIngredient10": mealIngredient10,
        "mealIngredient11": mealIngredient11,
        "mealIngredient12": mealIngredient12,
        "mealIngredient13": mealIngredient13,
        "mealIngredient14": mealIngredient14,
        "mealIngredient15": mealIngredient15,
        "mealIngredient16": mealIngredient16,
        "mealIngredient17": mealIngredient17,
        "mealIngredient18": mealIngredient18,
        "mealIngredient19": mealIngredient19,
        "mealIngredient20": mealIngredient20,
        "mealMeasure1": mealMeasure1,
        "mealMeasure2": mealMeasure2,
        "mealMeasure3": mealMeasure3,
        "mealMeasure4": mealMeasure4,
        "mealMeasure5": mealMeasure5,
        "mealMeasure6": mealMeasure6,
        "mealMeasure7": mealMeasure7,
        "mealMeasure8": mealMeasure8,
        "mealMeasure9": mealMeasure9,
        "mealMeasure10": mealMeasure10,
        "mealMeasure11": mealMeasure11,
        "mealMeasure12": mealMeasure12,
        "mealMeasure13": mealMeasure13,
        "mealMeasure14": mealMeasure14,
        "mealMeasure15": mealMeasure15,
        "mealMeasure16": mealMeasure16,
        "mealMeasure17": mealMeasure17,
        "mealMeasure18": mealMeasure18,
        "mealMeasure19": mealMeasure19,
        "mealMeasure20": mealMeasure20,
      };
}
