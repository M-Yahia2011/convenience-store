import 'package:flutter/material.dart';
import 'package:grocery_store/models/item.dart';
import 'package:grocery_store/providers/cart_provider.dart';
import 'package:grocery_store/screens/categories_table_screen.dart';
import 'package:grocery_store/widgets/item_counter_modifier.dart';
import 'package:provider/provider.dart';

class ItemDetailsScreen extends StatelessWidget {
  static const routeName = "/item-details";

  const ItemDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Consumer<CartProvider>(
        builder: (ctx, cartProvider, _) => Column(
          children: [
            SizedBox(
              width: 400,
              child: Image.asset(item.image),
            ),
            Text(
              item.name,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            cartProvider.isCartItem(item.id)
                ? SizedBox(
                    width: 250, child: ItemCounterModifier(itemID: item.id))
                : SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () async {
                        Provider.of<CartProvider>(context, listen: false)
                            .addItem(item);
                      },
                      child: Text("ADD"),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    ),
                  ),
            TextButton(
                onPressed: () => Navigator.of(context)
                    .pushNamed(CategoriesTableScreen.routeName),
                child: Text("Other Categories")),
          ],
        ),
      ),
    );
  }
}
