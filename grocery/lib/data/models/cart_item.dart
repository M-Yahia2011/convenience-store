import '/data/models/item.dart';

class CartItem extends Item {
  final int quantity;

  CartItem({
    required this.quantity,
    required id,
    required name,
    required price,
    required available,
    required category,
    required image,
  }) : super(
            name: name,
            available: available,
            category: category,
            id: id,
            image: image,
            price: price);
  @override
  String toString() {
    return "$id, $name, $price, $image, $category, $available";
  }
}
