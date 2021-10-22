class Category {
  final String name;
  final String iconPath;

  const Category(this.name, this.iconPath);
}

class Data {
  static List<Category> categories = [
    Category("Veggies", "assets/images/categories/veggies.png"),
    Category("Fruits", "assets/images/categories/fruits.png"),
    Category("Bakery", "assets/images/categories/bakery.png"),
    Category("Dairy", "assets/images/categories/dairy.png"),
    Category("Cosmetics", "assets/images/categories/cosmetics.png"),
    Category("Beverages", "assets/images/categories/beverages.png"),
    Category("Household", "assets/images/categories/household.png"),
    Category("Frozen", "assets/images/categories/frozen.png"),
  ];
}
