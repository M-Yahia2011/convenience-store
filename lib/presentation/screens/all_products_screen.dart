import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../managers/products_provider.dart';
import '../widgets/home_tab/presented_item.dart';

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
        title: const Text("All Products"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text("Suggested for you"),
                const Spacer(),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list),
                    label: const Text("Filter"))
              ],
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
