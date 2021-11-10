import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store/helpers/colors.dart';
import 'package:grocery_store/helpers/data.dart';
import 'package:grocery_store/models/item.dart';
import 'package:grocery_store/providers/cart_provider.dart';
import 'package:grocery_store/screens/categories_table_screen.dart';
import 'package:grocery_store/screens/category_screen.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Consumer<CartProvider>(
          builder: (ctx, cartProvider, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: () => Navigator.of(context).pushNamed(
                    CategoryScreen.routeName,
                    arguments: item.category),
                icon: Icon(
                  Icons.arrow_forward,
                  size: 18,
                ),
                label: Text(
                  Data.getCategoryByID(item.category).name,
                ),
              ),
              Text(
                item.name,
                style: Theme.of(context).textTheme.headline1,
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey[200]!)),
                width: double.infinity,
                height: 250,
                margin: EdgeInsets.fromLTRB(0, 15, 0, 40),
                child: Image.asset(item.image),
              ),
              Row(
                children: [
                  Text(
                    "Price: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.sourceSansPro().fontFamily),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ItemPrice(price: item.price, fontSize: 25)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              cartProvider.isCartItem(item.id)
                  ? Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      child: ItemCounterModifier(itemID: item.id))
                  : Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      child: ElevatedButton(
                        onPressed: () async {
                          Provider.of<CartProvider>(context, listen: false)
                              .addItem(item);
                        },
                        child: Text(
                          "Add to cart",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      ),
                    ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushNamed(CategoriesTableScreen.routeName),
                    child: Text(
                      "Explore other Categories",
                      style: TextStyle(color: Colors.amber[800]),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemPrice extends StatelessWidget {
  const ItemPrice({Key? key, required this.price, required this.fontSize})
      : super(key: key);

  final double price;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: "EGP",
          style: TextStyle(
              color: MyColors.colors[50],
              fontWeight: FontWeight.bold,
              fontSize: fontSize * 0.5),
        ),
        TextSpan(
          text: "$price",
          style: TextStyle(
              color: MyColors.colors[50],
              fontWeight: FontWeight.bold,
              fontSize: fontSize),
        ),
      ]),
    );
  }
}
