import 'package:flutter/material.dart';
import '../helpers/colors.dart';

class AdContainer extends StatelessWidget {
  const AdContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("25% Discount on"),
            Text("BlackBerry"),
            Text("Order it now"),
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
