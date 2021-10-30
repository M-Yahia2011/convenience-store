import 'package:flutter/material.dart';
import 'package:grocery_store/models/item.dart';
import 'package:grocery_store/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../helpers/colors.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: EdgeInsets.symmetric(vertical: 5),
      color: MyColors.colors[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            // height: 200,
            width: 180,
            child: Image.asset(
              image,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.headline6,
              ),
              // SizedBox(height: 20),
              Text("Item description",
                  style: Theme.of(context).textTheme.subtitle2),

              Text(
                "$price \$",
                style: TextStyle(
                    color: MyColors.colors[50],
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
          Consumer<CartProvider>(
            builder: (ctx, cartProvider, _) => Container(
                width: 30,
                height: 120,
                margin: EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                    color: Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: CircleAvatar(
                        backgroundColor: MyColors.colors,
                        radius: 15,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          color: Colors.black,
                          icon: Icon(Icons.add),
                          onPressed: () {
                            cartProvider.addItem(Item(
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
                            .subtitle1!
                            .copyWith(fontSize: 18)),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.black,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          // color: Colors.white,
                          icon: Icon(Icons.remove),
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
