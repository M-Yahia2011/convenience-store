import 'package:flutter/material.dart';
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
              Container(
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
                  ))
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
