import 'package:flutter/material.dart';

import '../widgets/ordered_item_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  static const routeName = "/orders";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (ctx, idx) {
                return Container(
                  height: 20,
                  color: Colors.amber,
                  child: const Text("Order NO. 123456"),
                );
              },
              itemBuilder: (ctx, idx) {
                return const OrderedItem();
              })),
    );
  }
}
