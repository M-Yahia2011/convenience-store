import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../helpers/app_theme.dart';
import 'presentation/managers/cart_provider.dart';
import 'presentation/managers/products_provider.dart';
import 'presentation/screens/all_products_screen.dart';
import 'presentation/screens/categories_table_screen.dart';
import 'presentation/screens/category_screen.dart';
import 'presentation/screens/item_details_screen.dart';
import 'presentation/screens/orders_screen.dart';
import 'presentation/screens/tab_screen.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.amber, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Grocery Store",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: const TabScreen(),
        routes: {
          CategoryScreen.routeName: (ctx) => const CategoryScreen(),
          CategoriesTableScreen.routeName: (ctx) => const CategoriesTableScreen(),
          AllProductsScreen.routeName: (ctx) => const AllProductsScreen(),
          OrdersScreen.routeName:(ctx)=> const OrdersScreen(),
          ItemDetailsScreen.routeName:(ctx)=>const ItemDetailsScreen(),
        },
      ),
    );
  }
}
