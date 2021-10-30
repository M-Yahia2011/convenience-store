import 'package:flutter/material.dart';
import 'package:grocery_store/providers/products_provider.dart';
import 'package:grocery_store/widgets/presented_item.dart';
import 'package:provider/provider.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({Key? key}) : super(key: key);
  static const routeName = "/all-Products";

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<ProductsProvider>(context).items;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        title: Text("All Products"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("Suggested for you"),
                Spacer(),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.filter_list),
                    label: Text("Filter"))
              ],
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 30,
                  ),
                  itemCount: items.length,
                  itemBuilder: (ctx, idx) {
                    return PresentedItem(items[idx]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
