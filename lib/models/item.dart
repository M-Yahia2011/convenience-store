import 'dart:convert';

class Item {
    Item({
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

    factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Item.fromMap(Map<String, dynamic> json) => Item(
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
