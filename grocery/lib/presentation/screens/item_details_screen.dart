import 'package:flutter/material.dart';
import '../widgets/home_tab/item_counter_modifier.dart';
import '/domain/entities/product_entity.dart';
import 'package:grocery_store/helpers/data.dart';
import 'package:provider/provider.dart';
import '../managers/cart_provider.dart';
import 'categories_table_screen.dart';
import 'category_screen.dart';

class ItemDetailsScreen extends StatelessWidget {
  static const routeName = "/item-details";

  const ItemDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductEntity item =
        ModalRoute.of(context)!.settings.arguments as ProductEntity;
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () => Navigator.of(context).pushNamed(
                        CategoryScreen.routeName,
                        arguments: item.category),
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 18,
                    ),
                    label: Text(
                      Data.getCategoryByID(item.category).name,
                    ),
                  ),
                ],
              ),
              Text(
                item.name,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              //TODO: horizontal Listview of the item images
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey[200]!)),
                height: MediaQuery.sizeOf(context).height / 5,
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 40),
                child: Image.asset(item.image),
              ),
              Row(
                children: [
                  const Text(
                    "Price: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ItemPrice(price: item.price, fontSize: 25)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              cartProvider.isCartItem(item.id)
                  ? Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      child: ItemCounterModifier(itemID: item.id))
                  : Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      child: ElevatedButton(
                        onPressed: () async {
                          Provider.of<CartProvider>(context, listen: false)
                              .addItem(item);
                        },
                        child: const Text(
                          "Add to cart",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      ),
                    ),
              const SizedBox(
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
              // color: MyColors.colors[50],
              fontWeight: FontWeight.bold,
              fontSize: fontSize * 0.5),
        ),
        TextSpan(
          text: "$price",
          style: TextStyle(
              // color: MyColors.colors[50],
              fontWeight: FontWeight.bold,
              fontSize: fontSize),
        ),
      ]),
    );
  }
}
