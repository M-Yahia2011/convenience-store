import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/colors.dart';

/// Container for ADs & Sale
class AdContainer extends StatelessWidget {
  const AdContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final containerFontTheme =
        TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        height: 130,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: MyColors.colors,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "25% ",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "Discount on",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Text(
                "Blackberry",
                style: TextStyle(
                  fontFamily: GoogleFonts.sourceSansPro().fontFamily,
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                "ORDER IT NOW!",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      Positioned(
          right: 10,
          top: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2.5),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2, color: Colors.black54, spreadRadius: 0)
                ]),
            child: CircleAvatar(
              radius: 80,
              // backgroundColor: MyColors.colors[50],
              backgroundImage: AssetImage("assets/images/bb.png"),
            ),
          )),
    ]);
  }
}
