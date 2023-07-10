
import '../data/models/category.dart';
import '../domain/entities/product_entity.dart';

class Data {
  static List<Category> categories = [
    const Category("Veggies", "assets/images/categories/veggies.png", id: 0),
    const Category("Fruits", "assets/images/categories/fruits.png", id: 1),
    const Category("Bakery", "assets/images/categories/bakery.png", id: 2),
    const Category("Dairy", "assets/images/categories/dairy.png", id: 3),
    const Category("Cosmetics", "assets/images/categories/cosmetics.png", id: 4),
    const Category("Beverages", "assets/images/categories/beverages.png", id: 5),
    const Category("Household", "assets/images/categories/household.png", id: 6),
    const Category("Frozen", "assets/images/categories/frozen.png", id: 7),
  ];

  static List<ProductEntity> products = [
    ProductEntity(
        id: "0",
        name: "Banana",
        price: 10.50,
        available: 1,
        category: 1,
        image: "assets/images/banana.png"),
    ProductEntity(
        id: '1',
        name: "Shovel & Broom",
        price: 20,
        available: 1,
        category: 6,
        image: "assets/images/shovel.png"),
    ProductEntity(
        id: '2',
        name: "Apples",
        price: 7,
        available: 1,
        category: 1,
        image: "assets/images/apple.png"),
    ProductEntity(
        id: '3',
        name: "Blackberry",
        price: 5,
        available: 1,
        category: 1,
        image: "assets/images/bb.png"),
    ProductEntity(
        id: '4',
        name: "Carrots",
        price: 2,
        available: 1,
        category: 0,
        image: "assets/images/carrots.png"),
    // ProductEntity(id: 5, name: "Blackberry", price: 22, available: 1, category: 2,image:"assets/images/banana.png"),
  ];

  static Category getCategoryByID(int id) {
    return categories.firstWhere((category) => category.id == id);
  }

  // static List<User> users =[ User(
  //     userID: "0",
  //     userName: "Mohamed",
  //     userImage: "",
  //     userPhone: "0100022200",
  //     ProductEntitys: ["0"])];

  // static List<String>?  ProductEntitysForUser(String userID) {
  //   return users[0].ProductEntitys;
  // }
}
