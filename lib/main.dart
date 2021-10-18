import "package:flutter/material.dart";
import 'package:grocery_store/colors.dart';

import 'screens/tab_screen.dart';

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
      theme: ThemeData(
          // backgroundColor: MyColors.colors[200],
          primarySwatch: MyColors.colors,
          brightness: Brightness.light,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.black,
              selectedIconTheme: IconThemeData(color: MyColors.colors),
              unselectedIconTheme: IconThemeData(color: MyColors.colors[100]),
              unselectedItemColor: MyColors.colors[100],
              showUnselectedLabels: true),
          textTheme: TextTheme(
            bodyText2: TextStyle(fontSize: 18),
            subtitle1: TextStyle(fontSize: 14),
          ),
          iconTheme: IconThemeData(size: 30),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber[600]!)))),
      home: TabScreen(),
    );
  }
}
