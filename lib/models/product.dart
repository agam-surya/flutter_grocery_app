import 'dart:convert';

List<Product?>? productFromJson(String str) => json.decode(str) == null
    ? []
    : List<Product?>.from(json.decode(str)!.map((x) => Product.fromJson(x)));

String productToJson(List<Product?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  final int? id;
  final String? title;
  final int? price;
  final String? description;
  final Category? category;
  final List<String?>? images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        category: Category.fromJson(json["category"]),
        images: json["images"] == null
            ? []
            : List<String?>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category!.toJson(),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  final int? id;
  final String? name;
  final String? image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
