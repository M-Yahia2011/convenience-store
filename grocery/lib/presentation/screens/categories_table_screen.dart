import 'package:flutter/material.dart';
import '../../data/models/category.dart';
import '../../helpers/data.dart';
import '/helpers/colors.dart';
import 'category_screen.dart';

class CategoriesTableScreen extends StatelessWidget {
  const CategoriesTableScreen({Key? key}) : super(key: key);
  static const routeName = "/categories-table";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Categories"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Align(
          alignment: Alignment.topCenter,
          child: Table(
            defaultColumnWidth: const FixedColumnWidth(90),
            children: [
              TableRow(children: [
                CategoryTableItem(Data.categories[0]),
                CategoryTableItem(Data.categories[1]),
                CategoryTableItem(Data.categories[2]),
              ]),
              TableRow(children: [
                CategoryTableItem(Data.categories[3]),
                CategoryTableItem(Data.categories[4]),
                CategoryTableItem(Data.categories[5]),
              ]),
              TableRow(children: [
                CategoryTableItem(Data.categories[6]),
                CategoryTableItem(Data.categories[7]),
                const SizedBox(),
              ])
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTableItem extends StatelessWidget {
  final Category _category;
  const CategoryTableItem(this._category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          CategoryScreen.routeName,
          arguments: _category.id
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(4),
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: MyColors.colors),
              child: Image.asset(_category.iconPath),
            ),
            Text(
              // "CategoryName",
              _category.name,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
