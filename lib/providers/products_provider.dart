import 'package:flutter/cupertino.dart';
import 'package:grocery_store/helpers/data.dart';
import 'package:grocery_store/models/item.dart';
import 'package:dio/dio.dart';

/*
- fetch top products for the home screen

- fetch for the filtered screen also so that the filtration would be done on the server side
  you send how it should be filtered and the server handles it and sends you back the data

*/

class ProductsProvider with ChangeNotifier {
  final _dio = Dio();
  final List<Item> _items = Data.allItems;
  List<Item> _filteredList = [];
  List<Item> _topItems = [];
  List<Item> get items => [..._items];
  List<Item> get topItems => [..._topItems];
  List<Item> get filteredItems => [..._filteredList];

  Future<void> getTopItems() async {
    try {
      final Response response = await _dio.get("");
      if (response.statusCode == 200) {
        final List<Item> retrievedList = [];
        for (var item in response.data) {
          retrievedList.add(Item.fromJson(item));
        }
        _topItems = retrievedList;
        notifyListeners();
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> getFilteredByCategory(categoryID) async {
    try {
      final Response response = await _dio.get(
        "",
        queryParameters: {"categoryID": categoryID},
      );

      if (response.statusCode == 200) {
        final List<Item> retrievedList = [];
        for (var item in response.data) {
          retrievedList.add(Item.fromJson(item));
        }
        _filteredList = retrievedList;
        notifyListeners();
      }
    } catch (error) {
      rethrow;
    }
  }


  List<Item> filterByCategory(int category) {
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
