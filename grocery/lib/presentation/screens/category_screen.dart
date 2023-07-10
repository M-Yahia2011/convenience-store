import 'package:flutter/material.dart';
import 'package:grocery_store/helpers/data.dart';
import 'package:provider/provider.dart';

import '../managers/products_provider.dart';
import '../widgets/presented_item.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = "/choose-category";
  const CategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
            Data.categories.firstWhere((element) => element.id == id).name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ProductsProvider>(builder: (ctx, provider, _) {
          final items = provider.filterByCategory(id);

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 30,
            ),
            itemBuilder: (ctx, idx) => PresentedItem(items[idx]),
            itemCount: items.length,
          );
        }),
      ),
    );
  }
}
