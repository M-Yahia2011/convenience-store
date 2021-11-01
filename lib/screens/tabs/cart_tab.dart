import 'package:flutter/material.dart';
import 'package:grocery_store/helpers/colors.dart';
import 'package:grocery_store/providers/cart_provider.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import '/widgets/cart_item.dart';

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  bool _isLoading = false;
  Future<void> purchase() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<CartProvider>(context, listen: false).purchase();
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Your order has been placed successfully!")));

      Provider.of<CartProvider>(context, listen: false).clear();
      // Navigator.of(context).pushNamed(routeName) // navigate to track order or whatever
    } catch (error) {
      setState(() {
        _isLoading = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("SOME ERROR OCCURED")));
      });
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: LoadingOverlay(
      isLoading: _isLoading,
      color: Colors.grey[100],
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
            if (cartProvider.cartItems.isEmpty)
              Expanded(
                  child: Center(
                      child: Text(
                "Your cart is Empty!",
                style: Theme.of(context).textTheme.headline5,
              ))),
            if (cartProvider.cartItems.isNotEmpty)
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
            if (cartProvider.cartItems.isNotEmpty)
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 16),
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: purchase,
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
      }),
    ));
  }
}
