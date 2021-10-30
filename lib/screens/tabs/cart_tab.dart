import 'package:flutter/material.dart';
import 'package:grocery_store/helpers/colors.dart';
import 'package:grocery_store/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '/widgets/cart_item.dart';

class CartTab extends StatelessWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<CartProvider>(builder: (ctx, cartProvider, _) {
      final items = cartProvider.cartItems;
      return Column(
        children: [
          // SizedBox(
          //   height: 50,
          //   child: Stack(
          //     children: [
          //       // IconButton(
          //       //     onPressed: () {}, icon: Icon(Icons.arrow_back_rounded)),
          //       Align(
          //         alignment: Alignment.center,
          //         child: Text(
          //           "Your Cart",
          //           textAlign: TextAlign.center,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            itemCount: cartProvider.cartItemsNum,
            itemBuilder: (ctx, idx) => CartItem(
              id: items[idx].id,
              category: items[idx].category,
              available: items[idx].available,
              image: items[idx].image,
              name: items[idx].name,
              price: items[idx].price,
              quantity: items[idx].quantity,
            ),
          )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 85,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16))),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  child: Column(
                    children: [
                      Text(
                        "Subtotal:",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${cartProvider.subTotal} \$",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: MyColors.colors,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              bottomRight: Radius.circular(16))),
                      // alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("CHECKOUT"),
                          Icon(Icons.arrow_forward_rounded)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      );
    }));
  }
}
