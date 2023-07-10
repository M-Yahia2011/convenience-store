import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../managers/cart_provider.dart';

class FavouritesTab extends StatelessWidget {
  const FavouritesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (ctx, xartProvider, _) {
      return const SizedBox();
      // return GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     childAspectRatio: 1,
      //     crossAxisSpacing: 16,
      //     mainAxisSpacing: 30,
      //   ),
      //   itemBuilder: (ctx, idx) => PresentedItem(items[idx]),
      //   itemCount: items.length,
      // );
    });
  }
}
