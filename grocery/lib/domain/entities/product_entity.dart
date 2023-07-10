import 'dart:convert';

class ProductEntity {
    ProductEntity({
        required this.id,
        required this.name,
        required this.price,
        required this.available,
        required this.category,
        required this.image,
    });

    final String id;
    final String name;
    final double price;
    final int available;
    final int category;
    final String image;
    

    factory ProductEntity.fromJson(String str) => ProductEntity.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductEntity.fromMap(Map<String, dynamic> json) => ProductEntity(
        id: json["id"],
        name: json["name"],
        price: json["price"].toDouble(),
        available: json["available"],
        category: json["category"],
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "price": price,
        "available": available,
        "category": category,
        "image": image,
    };
}
