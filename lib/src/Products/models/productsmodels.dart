import 'dart:convert';

class Products {
  int id;
  String title;
  double price;
  String description;
  bool isFeatured;
  String clothesType;
  double ratings;
  List<String> colors;
  List<String> imageUrls;
  List<String> sizes;
  DateTime createdAt;
  int category;
  int brand;

  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.isFeatured,
    required this.clothesType,
    required this.ratings,
    required this.colors,
    required this.imageUrls,
    required this.sizes,
    required this.createdAt,
    required this.category,
    required this.brand,
  });

  factory Products.fromRawJson(String str) =>
      Products.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        isFeatured: json["is_featured"],
        clothesType: json["clothesType"],
        ratings: json["ratings"]?.toDouble(),
        colors: List<String>.from(json["colors"].map((x) => x)),
        imageUrls: List<String>.from(json["imageUrls"].map((x) => x)),
        sizes: List<String>.from(json["sizes"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        category: json["category"],
        brand: json["brand"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "is_featured": isFeatured,
        "clothesType": clothesType,
        "ratings": ratings,
        "colors": List<dynamic>.from(colors.map((x) => x)),
        "imageUrls": List<dynamic>.from(imageUrls.map((x) => x)),
        "sizes": List<dynamic>.from(sizes.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "category": category,
        "brand": brand,
      };
}
