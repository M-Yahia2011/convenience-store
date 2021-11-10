import 'package:flutter/material.dart';
import 'package:grocery_store/helpers/colors.dart';
import 'package:grocery_store/screens/item_details_screen.dart';
import '../models/item.dart';
import '../providers/cart_provider.dart';
import '../widgets/item_counter_modifier.dart';
import 'package:provider/provider.dart';

class PresentedItem extends StatefulWidget {
  final Item item;
  const PresentedItem(this.item, {Key? key}) : super(key: key);
  @override
  State<PresentedItem> createState() => _PresentedItemState();
}

class _PresentedItemState extends State<PresentedItem> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                      ItemDetailsScreen.routeName,
                      arguments: widget.item),
                  child: Center(
                      child: Image.asset(
                    widget.item.image,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center,
                  )),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    widget.item.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  ItemPrice(price: widget.item.price),
                ],
              ),
              Consumer<CartProvider>(
                builder: (ctx, cartProvider, _) {
                  if (cartProvider.isCartItem(widget.item.id) == false) {
                    return Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        child: SizedBox(
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () async {
                              Provider.of<CartProvider>(context, listen: false)
                                  .addItem(widget.item);
                            },
                            child: Text("ADD"),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 14),
                            ),
                          ),
                        ));
                  } else {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: ItemCounterModifier(itemID: widget.item.id));
                  }
                },
              )
            ],
          ),
        ),
        Positioned(
            bottom: 70,
            right: 10,
            child: IconButton(
              icon: Icon(
                isFavourite ? Icons.favorite_outline : Icons.favorite_sharp,
                color: Colors.red,
                size: 30,
              ),
              padding: EdgeInsets.all(10),
              onPressed: () {
                setState(() {
                  isFavourite = !isFavourite;
                });
              },
            )),
      ],
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
        TextSpan(
          text: "EGP",
          style: TextStyle(
              color: MyColors.colors[50],
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
        TextSpan(
          text: "$price",
          style: TextStyle(
              color: MyColors.colors[50],
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ]),
    );
  }
}
