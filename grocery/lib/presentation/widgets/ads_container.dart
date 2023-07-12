import 'package:flutter/material.dart';

/// Container for ADs & Sale
class AdContainer extends StatelessWidget {
  const AdContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        height: MediaQuery.sizeOf(context).height / 4.5,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          // color: MyColors.colors,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "25% ",
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "Discount",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: Text(
                "Blackberry",
                style: TextStyle(
                  fontSize: 30,
                  // color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Expanded(
              child: Text(
                "ORDER IT NOW!",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
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
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 2, color: Colors.black54, spreadRadius: 0)
                ]),
            child: CircleAvatar(
              radius: 80,
              // backgroundColor: MyColors.colors[50],
              backgroundImage: const AssetImage("assets/images/bb.png"),
              backgroundColor: Colors.grey[200],
            ),
          )),
    ]);
  }
}
