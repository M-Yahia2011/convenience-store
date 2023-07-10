import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_store/helpers/colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
      primarySwatch: MyColors.colors,
      brightness: Brightness.light,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedIconTheme: const IconThemeData(color: MyColors.colors),
          unselectedIconTheme: IconThemeData(color: MyColors.colors[100]),
          unselectedItemColor: MyColors.colors[100],
          showUnselectedLabels: true),
      textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18),
          titleMedium: TextStyle(fontSize: 14),
          displayLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),),
      iconTheme: const IconThemeData(size: 30),
      scaffoldBackgroundColor: Colors.grey[100],
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle:
              MaterialStateProperty.all<TextStyle>(const TextStyle(fontSize: 16)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.amber[800]!),
        ),
      ),
      appBarTheme: const AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: MyColors.colors)));
}
