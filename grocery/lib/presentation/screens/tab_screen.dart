import 'package:flutter/material.dart';
import 'package:grocery_store/utils/theme_constants.dart';
import 'package:provider/provider.dart';
import '../managers/cart_provider.dart';
import '../widgets/badge.dart';
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

    // listen to any change on controller then change tabidx
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
      
      body: TabBarView(
        controller: _controller,
        children: const [HomeTab(), FavouritesTab(), CartTab(), ProfileTap()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIdx,
        onTap: (tappedIdx) {
          setState(() {
            tabIdx = tappedIdx;
            _controller.animateTo(tappedIdx);
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: "Home"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded), label: "Saved Items"),
          BottomNavigationBarItem(
              icon: Consumer<CartProvider>(
                builder: (ctx, cartProvider, _) => Stack(
                  children: [
                    cartProvider.cartItemsNum == 0
                        ? const SizedBox()
                        : Positioned(
                            top: 0,
                            right: 0,
                            child: MyBadge(
                              value: cartProvider.cartItemsNum.toString(),
                              color: ThemeConstants.mainColor,
                            ),
                          ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Icon(
                        Icons.shopping_cart_rounded,
                      ),
                    ),
                  ],
                ),
              ),
              label: "Cart"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile")
        ],
      ),
    );
  }
}
