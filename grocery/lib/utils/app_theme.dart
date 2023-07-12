import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store/utils/theme_constants.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
      colorSchemeSeed: ThemeConstants.mainColor,
      brightness: Brightness.light,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold)),
      textTheme: TextTheme(
        bodyMedium: GoogleFonts.sourceSansPro(fontSize: 16),
      ),
      iconTheme: const IconThemeData(size: 30),
      scaffoldBackgroundColor: Colors.grey[100],
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(fontSize: 16)),
          foregroundColor:
              MaterialStateProperty.all<Color>(ThemeConstants.mainColor),
        ),
      ),
      appBarTheme: const AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Color(0xff2291FF))));
}
