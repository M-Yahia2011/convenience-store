import "package:flutter/material.dart";
import '/config/app_router.dart';
import 'package:provider/provider.dart';
import '../utils/app_theme.dart';
import 'presentation/managers/cart_provider.dart';
import 'presentation/managers/products_provider.dart';
import 'presentation/screens/tab_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.amber, // status bar color
  //   ),
  // );
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
        onGenerateRoute: AppRouter.route,
      ),
    );
  }
}
