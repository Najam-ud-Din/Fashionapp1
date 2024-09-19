// To parse this JSON data, do
//
//     final categoies = categoiesFromJson(jsonString);

import 'dart:convert';

List<Categoies> categoiesFromJson(String str) =>
    List<Categoies>.from(json.decode(str).map((x) => Categoies.fromJson(x)));

String categoiesToJson(List<Categoies> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categoies {
  String title;
  int id;
  String imageUrl;

  Categoies({
    required this.title,
    required this.id,
    required this.imageUrl,
  });

  factory Categoies.fromJson(Map<String, dynamic> json) => Categoies(
        title: json["title"],
        id: json["id"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "id": id,
        "imageUrl": imageUrl,
      };
}
