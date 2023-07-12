import 'package:flutter/material.dart';
import 'package:grocery_store/presentation/screens/item_details_screen.dart';
import 'package:grocery_store/presentation/screens/orders_screen.dart';
import 'package:grocery_store/presentation/screens/shipping_address_screen.dart';

import '../presentation/screens/all_products_screen.dart';
import '../presentation/screens/categories_table_screen.dart';
import '../presentation/screens/category_screen.dart';
import '/presentation/screens/register_screen.dart';
import '/presentation/screens/sign_in_screen.dart';

class AppRouter {
  static Route<dynamic> route(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          case SignInScreen.routeName:
            return const SignInScreen();
          case RegisterScreen.routeName:
            return const RegisterScreen();
          case CategoryScreen.routeName:
            return const CategoryScreen();
          case CategoriesTableScreen.routeName:
            return const CategoriesTableScreen();
          case AllProductsScreen.routeName:
            return const AllProductsScreen();
          case OrdersScreen.routeName:
            return const OrdersScreen();
          case ItemDetailsScreen.routeName:
            return const ItemDetailsScreen();
          case ShippingAddressScreen.routeName:
            return const ShippingAddressScreen();
          default:
            return const RegisterScreen();
          // if (AuthService.authInstance.currentUser != null) {
          // return const AllNotesScreen();
          // } else {
          // return const RegisterScreen();
          // }
        }
      },
    );
  }
}
