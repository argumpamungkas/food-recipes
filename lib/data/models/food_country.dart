class FoodCountry {
  String country;

  FoodCountry({required this.country});

  factory FoodCountry.fromJson(Map<String, dynamic> json) =>
      FoodCountry(country: json["strArea"] ?? "");

  Map<String, dynamic> toJson() => {
        "country": country,
      };
}
