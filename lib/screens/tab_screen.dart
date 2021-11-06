import 'package:flutter/material.dart';
import 'package:grocery_store/helpers/colors.dart';
import 'package:grocery_store/providers/cart_provider.dart';
import 'package:grocery_store/widgets/badge.dart';
import 'package:provider/provider.dart';
import 'tabs/cart_tab.dart';
import 'tabs/favourites_tab.dart';
import 'tabs/home_tab.dart';
import 'tabs/profile_tab.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int tabIdx = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
    _controller.addListener(() {
      if (tabIdx != _controller.index) {
        setState(() {
          tabIdx = _controller.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.colors[200],
      body: TabBarView(
        controller: _controller,
        children: [HomeTab(), FavouritesTab(), CartTab(), ProfileTap()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIdx,
        onTap: (currentIdx) {
          setState(() {
            tabIdx = currentIdx;
            _controller.animateTo(currentIdx);
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded), label: "Saved Items"),
          BottomNavigationBarItem(
              icon: Consumer<CartProvider>(
                builder: (ctx, cartProvider, _) => Stack(
                  children: [
                    cartProvider.cartItemsNum == 0
                        ? SizedBox()
                        : Badge(
                            value: cartProvider.cartItemsNum.toString(),
                            color: Colors.amber),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(
                        Icons.shopping_cart_rounded,
                      ),
                    ),
                  ],
                ),
              ),
              label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
      ),
    );
  }
}
