// To parse this JSON data, do
//
//     final productsEntry = productsEntryFromJson(jsonString);

import 'dart:convert';

List<ProductsEntry> productsEntryFromJson(String str) => List<ProductsEntry>.from(json.decode(str).map((x) => ProductsEntry.fromJson(x)));

String productsEntryToJson(List<ProductsEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsEntry {
    String id;
    String name;
    int price;
    String description;
    String thumbnail;
    String category;
    bool isFeatured;
    int stock;
    String brand;
    String league;
    String team;
    String season;
    int userId;

    ProductsEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.thumbnail,
        required this.category,
        required this.isFeatured,
        required this.stock,
        required this.brand,
        required this.league,
        required this.team,
        required this.season,
        required this.userId,
    });

    factory ProductsEntry.fromJson(Map<String, dynamic> json) => ProductsEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        category: json["category"],
        isFeatured: json["is_featured"],
        stock: json["stock"],
        brand: json["brand"],
        league: json["league"],
        team: json["team"],
        season: json["season"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "thumbnail": thumbnail,
        "category": category,
        "is_featured": isFeatured,
        "stock": stock,
        "brand": brand,
        "league": league,
        "team": team,
        "season": season,
        "user_id": userId,
    };
}
