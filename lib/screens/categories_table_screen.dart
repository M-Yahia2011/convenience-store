import 'package:flutter/material.dart';
import 'package:grocery_store/helpers/data.dart';
import '/helpers/colors.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static const routeName = "/categories-table";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Categories"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Align(
          alignment: Alignment.topCenter,
          child: Table(
            defaultColumnWidth: FixedColumnWidth(90),
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
                SizedBox(),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 8),
            padding: EdgeInsets.all(4),
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: MyColors.colors),
            child: Image.asset(_category.iconPath),
          ),
          Text(
            // "CategoryName",
            _category.name,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
