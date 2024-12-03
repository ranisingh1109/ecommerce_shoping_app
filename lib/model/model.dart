// // To parse this JSON data, do
// //
// //     final fakesStoreApi = fakesStoreApiFromJson(jsonString);
//
// import 'dart:convert';
//
// List<Product> fakesStoreApiFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
//
// String fakesStoreApiToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Product {
//   final int id;
//   final String title;
//   final double price;
//   final String description;
//   final Category category;
//   final String image;
//   final Rating rating;
//
//   Product({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.category,
//     required this.image,
//     required this.rating,
//   });
//
//   Product copyWith({
//     int? id,
//     String? title,
//     double? price,
//     String? description,
//     Category? category,
//     String? image,
//     Rating? rating,
//   }) =>
//       Product(
//         id: id ?? this.id,
//         title: title ?? this.title,
//         price: price ?? this.price,
//         description: description ?? this.description,
//         category: category ?? this.category,
//         image: image ?? this.image,
//         rating: rating ?? this.rating,
//       );
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//     id: json["id"],
//     title: json["title"],
//     price: json["price"]?.toDouble(),
//     description: json["description"],
//     category: categoryValues.map[json["category"]]!,
//     image: json["image"],
//     rating: Rating.fromJson(json["rating"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "price": price,
//     "description": description,
//     "category": categoryValues.reverse[category],
//     "image": image,
//     "rating": rating.toJson(),
//   };
// }
//
// enum Category {
//   ELECTRONICS,
//   JEWELERY,
//   MEN_S_CLOTHING,
//   WOMEN_S_CLOTHING
// }
//
// final categoryValues = EnumValues({
//   "electronics": Category.ELECTRONICS,
//   "jewelery": Category.JEWELERY,
//   "men's clothing": Category.MEN_S_CLOTHING,
//   "women's clothing": Category.WOMEN_S_CLOTHING
// });
//
// class Rating {
//   final double rate;
//   final int count;
//
//   Rating({
//     required this.rate,
//     required this.count,
//   });
//
//   Rating copyWith({
//     double? rate,
//     int? count,
//   }) =>
//       Rating(
//         rate: rate ?? this.rate,
//         count: count ?? this.count,
//       );
//
//   factory Rating.fromJson(Map<String, dynamic> json) => Rating(
//     rate: json["rate"]?.toDouble(),
//     count: json["count"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "rate": rate,
//     "count": count,
//   };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final List<String> images;
  final DateTime creationAt;
  final DateTime updatedAt;
  final Category category;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
  });

  Product copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    List<String>? images,
    DateTime? creationAt,
    DateTime? updatedAt,
    Category? category,
  }) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        images: images ?? this.images,
        creationAt: creationAt ?? this.creationAt,
        updatedAt: updatedAt ?? this.updatedAt,
        category: category ?? this.category,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    creationAt: DateTime.parse(json["creationAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "images": List<dynamic>.from(images.map((x) => x)),
    "creationAt": creationAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "category": category.toJson(),
  };
}

class Category {
  final int id;
  final Name name;
  final String image;
  final DateTime creationAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  Category copyWith({
    int? id,
    Name? name,
    String? image,
    DateTime? creationAt,
    DateTime? updatedAt,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        creationAt: creationAt ?? this.creationAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: nameValues.map[json["name"]]!,
    image: json["image"],
    creationAt: DateTime.parse(json["creationAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "image": image,
    "creationAt": creationAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

enum Name {
  CHANGE_TITLE,
  ELECTRONICS,
  MISCELLANEOUS,
  SHOES
}

final nameValues = EnumValues({
  "Change title": Name.CHANGE_TITLE,
  "Electronics": Name.ELECTRONICS,
  "Miscellaneous": Name.MISCELLANEOUS,
  "Shoes": Name.SHOES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
