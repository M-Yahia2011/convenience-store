import 'package:flutter/material.dart';
import 'package:grocery_store/widgets/presented_item.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = "/choose-category";
  const CategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("categoryName"),
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 30,
        ),
        children: List.generate(20, (index) => PresentedItem()),
      ),
    );
  }
}
