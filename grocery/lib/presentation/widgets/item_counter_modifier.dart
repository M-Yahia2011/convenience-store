import 'package:flutter/material.dart';
import 'package:grocery_store/domain/entities/product_entity.dart';
import '../../data/models/cart_item.dart';
import '../managers/cart_provider.dart';
import '/../helpers/colors.dart';
import 'package:provider/provider.dart';

/// A horizontal counter that is used if the item is in the cart
class ItemCounterModifier extends StatelessWidget {
  final String itemID;
  const ItemCounterModifier({Key? key, required this.itemID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartItem item = Provider.of<CartProvider>(context, listen: false)
        .getCartItembyId(itemID);

    return Container(
        height: 45,
        decoration: BoxDecoration(
            color: const Color(0xffF0F0F0), borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: MyColors.colors,
                radius: 20,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  color: Colors.black,
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false).addItem(
                        ProductEntity(
                            id: item.id,
                            name: item.name,
                            price: item.price,
                            available: item.available,
                            category: item.category,
                            image: item.image));
                  },
                ),
              ),
            ),
            Text(item.quantity.toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 20)),
            Padding(
              padding: const EdgeInsets.all(2),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  // color: Colors.white,
                  icon: const Icon(Icons.remove),
                  onPressed: () =>
                      Provider.of<CartProvider>(context, listen: false)
                          .removeItem(item.id),
                ),
              ),
            ),
          ],
        ));
  }
}
