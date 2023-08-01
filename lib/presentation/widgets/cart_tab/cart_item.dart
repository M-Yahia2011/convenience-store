import 'package:flutter/material.dart';
import 'package:grocery_store/domain/entities/product_entity.dart';
import 'package:provider/provider.dart';

import '../../managers/cart_provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final int available;
  final int category;
  final String image;
  const CartItem(
      {Key? key,
      required this.id,
      required this.name,
      required this.price,
      required this.quantity,
      required this.available,
      required this.category,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 5),
      // color: MyColors.colors[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            // height: 200,
            width: 120,
            child: Image.asset(
              image,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              // SizedBox(height: 20),
              Text("Item description",
                  style: Theme.of(context).textTheme.titleSmall),

              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "EGP",
                      style: TextStyle(
                          // color: MyColors.colors[50],
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    TextSpan(
                      text: "$price",
                      style: const TextStyle(
                          // color: MyColors.colors[50],
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    TextSpan(
                        text: " X$quantity",
                        style: const TextStyle(color: Colors.black, fontSize: 18))
                  ],
                ),
              )
            ],
          ),
          Consumer<CartProvider>(
            builder: (ctx, cartProvider, _) => Container(
                width: 40,
                height: 140,
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                    color: const Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: CircleAvatar(
                        // backgroundColor: MyColors.colors,
                        radius: 20,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          color: Colors.black,
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            cartProvider.addItem(ProductEntity(
                                id: id,
                                name: name,
                                price: price,
                                available: available,
                                category: category,
                                image: image));
                          },
                        ),
                      ),
                    ),
                    Text(quantity.toString(),
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
                          onPressed: () => cartProvider.removeItem(id),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
