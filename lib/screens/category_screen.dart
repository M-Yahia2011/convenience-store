import 'package:flutter/material.dart';
import 'package:grocery_store/providers/products_provider.dart';
import 'package:grocery_store/widgets/presented_item.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = "/choose-category";
  const CategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<ItemProvider>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: Text("categoryName"),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 30,
        ),
        itemBuilder: (ctx, idx) => PresentedItem(items[idx]),
        itemCount: items.length,
      ),
    );
  }
}
