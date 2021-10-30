import '../models/item.dart';
import '../models/category.dart';

class Data {
  static List<Category> categories = [
    Category("Veggies", "assets/images/categories/veggies.png", id: 0),
    Category("Fruits", "assets/images/categories/fruits.png", id: 1),
    Category("Bakery", "assets/images/categories/bakery.png", id: 2),
    Category("Dairy", "assets/images/categories/dairy.png", id: 3),
    Category("Cosmetics", "assets/images/categories/cosmetics.png", id: 4),
    Category("Beverages", "assets/images/categories/beverages.png", id: 5),
    Category("Household", "assets/images/categories/household.png", id: 6),
    Category("Frozen", "assets/images/categories/frozen.png", id: 7),
  ];
  static List<Item> allItems = [
    Item(
        id: "0",
        name: "Banana",
        price: 10.50,
        available: 1,
        category: 1,
        image: "assets/images/banana.png"),
    Item(
        id: '1',
        name: "Shovel & Broom",
        price: 20,
        available: 1,
        category: 6,
        image: "assets/images/shovel.png"),
    Item(
        id: '2',
        name: "Apples",
        price: 7,
        available: 1,
        category: 1,
        image: "assets/images/apple.png"),
    Item(
        id: '3',
        name: "Blackberry",
        price: 5,
        available: 1,
        category: 1,
        image: "assets/images/bb.png"),
    Item(
        id: '4',
        name: "Carrots",
        price: 2,
        available: 1,
        category: 0,
        image: "assets/images/carrots.png"),
    // Item(id: 5, name: "Blackberry", price: 22, available: 1, category: 2,image:"assets/images/banana.png"),
  ];
}
