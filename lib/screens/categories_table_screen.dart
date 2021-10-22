import 'package:flutter/material.dart';
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
                CategoryCard(),
                CategoryCard(),
                CategoryCard(),
                CategoryCard()
              ]),
              TableRow(children: [
                CategoryCard(),
                CategoryCard(),
                CategoryCard(),
                CategoryCard()
              ]),
              TableRow(children: [
                SizedBox(),
                CategoryCard(),
                CategoryCard(),
                SizedBox(),
              ])
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 8),
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: MyColors.colors),
            child: Icon(Icons.home),
          ),
          Text(
            // "CategoryName",
            "Fruits",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
