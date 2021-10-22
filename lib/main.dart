import "package:flutter/material.dart";
import 'package:grocery_store/screens/all_products_screen.dart';
import '../helpers/app_theme.dart';
import 'screens/tab_screen.dart';
import 'screens/categories_table_screen.dart';
import 'screens/category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Grocery Store",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      
      
      home: TabScreen(),
      routes: {
        CategoryScreen.routeName: (ctx) => CategoryScreen(),
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        AllProductsScreen.routeName:(ctx)=> AllProductsScreen(),
      },
    );
  }
}
