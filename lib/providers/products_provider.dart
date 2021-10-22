import 'package:flutter/cupertino.dart';
import 'package:grocery_store/models/item.dart';

class ItemProvider with ChangeNotifier {
  final List<Item> _items = [
    Item(id: 0, name: "Blackberry", price: 22, available: true, category: 0),
    Item(id: 1, name: "Blackberry", price: 22, available: true, category: 0),
    Item(id: 2, name: "Blackberry", price: 22, available: true, category: 1),
    Item(id: 3, name: "Blackberry", price: 22, available: true, category: 3),
    Item(id: 4, name: "Blackberry", price: 22, available: true, category: 0),
    Item(id: 5, name: "Blackberry", price: 22, available: true, category: 2),
  ];
  List<Item> get items => [..._items];

  Future<List<Item>> filterByCategory(int category) async {
    if (_items.isNotEmpty) {
      final filtered =
          _items.where((item) => item.category == category).toList();
      return filtered;
    }
    return [];
  }

  List<String> get categories => [
        "Veggies",
        "Fruits",
        "Bakery",
        "Dairy",
        "Cosmetics",
        "Beverages",
        "Household",
        "Frozed"
      ];
}
