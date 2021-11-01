import 'package:flutter/material.dart';
import 'package:grocery_store/helpers/colors.dart';
import 'package:grocery_store/models/item.dart';
import 'package:grocery_store/providers/cart_provider.dart';
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
                child: Center(
                    child: Image.asset(
                  widget.item.image,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                )),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.item.name,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    "${widget.item.price}\$",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
              Consumer<CartProvider>(
                builder: (ctx, cartProvider, _) {
                  if (cartProvider.isCartItem(widget.item.id) == false) {
                    return Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
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
                        ));
                  } else {
                    return ItemCounterModifier(itemID: widget.item.id);
                  }
                },
              )
            ],
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                isFavourite ? Icons.favorite_outline : Icons.favorite,
                color: Colors.amber[800],
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

class ItemCounterModifier extends StatelessWidget {
  final String itemID;
  const ItemCounterModifier({Key? key, required this.itemID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<CartProvider>(context, listen: false)
        .getCartItembyId(itemID);

    return Container(
        height: 45,
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Color(0xffF0F0F0), borderRadius: BorderRadius.circular(20)),
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
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false).addItem(
                        Item(
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
                    .subtitle1!
                    .copyWith(fontSize: 20)),
            Padding(
              padding: const EdgeInsets.all(2),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  // color: Colors.white,
                  icon: Icon(Icons.remove),
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
