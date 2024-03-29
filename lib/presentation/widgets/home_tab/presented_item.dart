import 'package:flutter/material.dart';
import 'package:grocery_store/utils/theme_constants.dart';

import 'package:provider/provider.dart';

import '../../../domain/entities/product_entity.dart';
import '../../managers/cart_provider.dart';
import '../../screens/item_details_screen.dart';
import 'item_counter_modifier.dart';

class PresentedItem extends StatefulWidget {
  final ProductEntity item;
  const PresentedItem(this.item, {Key? key}) : super(key: key);
  @override
  State<PresentedItem> createState() => _PresentedItemState();
}

class _PresentedItemState extends State<PresentedItem> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(ItemDetailsScreen.routeName, arguments: widget.item),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: ThemeConstants.itemBackgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                      child: Image.asset(
                    widget.item.image,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center,
                  )),
                ),
                const SizedBox(height: 4),
                Column(
                  children: [
                    FittedBox(
                      child: Text(
                        widget.item.name,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    FittedBox(child: ItemPrice(price: widget.item.price)),
                  ],
                ),
                const SizedBox(height: 4),
                Consumer<CartProvider>(
                  builder: (ctx, cartProvider, _) {
                    if (cartProvider.isCartItem(widget.item.id) == false) {
                      return Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          width: double.infinity,
                          child: SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () async {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .addItem(widget.item);
                              },
                              child: const Text(
                                "Add to cart",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ));
                    } else {
                      return ItemCounterModifier(itemID: widget.item.id);
                    }
                  },
                )
              ],
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  splashRadius: 25,
                  icon: Icon(
                    isFavourite ? Icons.favorite_outline : Icons.favorite_sharp,
                    color: ThemeConstants.mainColor,
                    size: 30,
                  ),
                  padding: const EdgeInsets.all(10),
                  onPressed: () {
                    setState(() {
                      isFavourite = !isFavourite;
                    });
                  },
                ),
              )),
        ],
      ),
    );
  }
}

class ItemPrice extends StatelessWidget {
  const ItemPrice({
    Key? key,
    required this.price,
  }) : super(key: key);

  final double price;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(
          text: "EGP",
          style: TextStyle(
              color: ThemeConstants.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
        TextSpan(
          text: "$price",
          style: const TextStyle(
              color: ThemeConstants.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ]),
    );
  }
}
