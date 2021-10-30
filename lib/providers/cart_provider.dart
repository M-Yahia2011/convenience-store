import 'package:flutter/material.dart';
import 'package:grocery_store/models/cart_item.dart';
import 'package:grocery_store/models/item.dart';

class CartProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  Map<String, CartItem> _cartItems = {};
  List<CartItem> get cartItems => [..._cartItems.values.toList()];
  int get cartItemsNum => _cartItems.length;
  double get subTotal {
    if (_cartItems.isEmpty) {
      return 0;
    }
    double sum = 0;
    _cartItems.forEach((itemID, item) {
      sum = sum + item.quantity * item.price;
    });
    return sum;
  }

  void addItem(Item item) {
    if (_cartItems.containsKey(item.id)) {
      _cartItems.update(
        item.id,
        (existingInstance) => CartItem(
          id: existingInstance.id,
          name: existingInstance.name,
          quantity: existingInstance.quantity + 1,
          price: existingInstance.price,
          available: existingInstance.available,
          category: existingInstance.category,
          image: existingInstance.image,
        ),
      );
    } else {
      _cartItems.putIfAbsent(
        item.id,
        () => CartItem(
          id: item.id,
          quantity: 1,
          price: item.price,
          available: item.available,
          category: item.category,
          image: item.image,
          name: item.name,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(itemID) {
    if (_cartItems[itemID]!.quantity > 1) {
      _cartItems.update(
        itemID,
        (existingInstance) => CartItem(
          id: existingInstance.id,
          name: existingInstance.name,
          quantity: existingInstance.quantity - 1,
          price: existingInstance.price,
          available: existingInstance.available,
          category: existingInstance.category,
          image: existingInstance.image,
        ),
      );
    } else {
      _cartItems.remove(itemID);
    }
    notifyListeners();
  }

  // clear on purchase
}
