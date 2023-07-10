import 'package:flutter/cupertino.dart';
import 'package:grocery_store/domain/entities/product_entity.dart';
import 'package:grocery_store/helpers/data.dart';
import 'package:dio/dio.dart';

/*
- fetch top products for the home screen

- fetch for the filtered screen also so that the filtration would be done on the server side
  you send how it should be filtered and the server handles it and sends you back the data

*/

class ProductsProvider with ChangeNotifier {
  final _dio = Dio();
  final List<ProductEntity> _items = Data.products;
  List<ProductEntity> _filteredList = [];
  List<ProductEntity> _topItems = [];
  List<ProductEntity> get items => [..._items];
  List<ProductEntity> get topItems => [..._topItems];
  List<ProductEntity> get filteredItems => [..._filteredList];

  Future<void> getTopItems() async {
    try {
      final Response response = await _dio.get("");
      if (response.statusCode == 200) {
        final List<ProductEntity> retrievedList = [];
        for (var item in response.data) {
          retrievedList.add(ProductEntity.fromJson(item));
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
        final List<ProductEntity> retrievedList = [];
        for (var item in response.data) {
          retrievedList.add(ProductEntity.fromJson(item));
        }
        _filteredList = retrievedList;
        notifyListeners();
      }
    } catch (error) {
      rethrow;
    }
  }

  List<ProductEntity> filterByCategory(int category) {
    if (_items.isNotEmpty) {
      final filtered =
          _items.where((item) => item.category == category).toList();
      return filtered;
    }
    return [];
  }
  
// maybe i should transform the items list into a map


  // List<ProductEntity> favoriteItems(List<String> favoriteItemsIDs) {
  //   List<ProductEntity> favoriteItems;
  //   for (var itemID in favoriteItemsIDs) {
  //     favoriteItems.add(_items.)
  //   }
  // }

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
