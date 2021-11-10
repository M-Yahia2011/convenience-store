import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_store/helpers/colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
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
          headline1: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),),
      iconTheme: IconThemeData(size: 30),
      scaffoldBackgroundColor: Colors.grey[100],
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle:
              MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 16)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.amber[800]!),
        ),
      ),
      appBarTheme: AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: MyColors.colors)));
}
