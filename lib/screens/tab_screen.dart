import 'package:flutter/material.dart';
import 'package:grocery_store/screens/cart_screen.dart';
import 'package:grocery_store/screens/home_screen.dart';
import 'package:grocery_store/screens/profile_screen.dart';
import 'package:grocery_store/screens/saved_items_screen.dart';

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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      
      body: TabBarView(
        controller: _controller,
        children: [
          HomeScreen(),
          SavedItemsScreen(),
          CartScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIdx,
        onTap: (currentIdx) {
          setState(() {
            tabIdx = currentIdx;
          });
          _controller.animateTo(currentIdx);
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded), label: "Saved Items"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
      ),
    );
  }
}
