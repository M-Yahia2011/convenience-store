import 'package:flutter/material.dart';
import 'package:grocery_store/utils/theme_constants.dart';

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
          color: ThemeConstants.textColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(8),
          // color: MyColors.colors,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "25% ",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "Off",
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
                      fontSize: 28,
                      // color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {},
                  child: const Text(
                    "ORDER IT NOW!",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold),
                  ),
                )),
              ],
            ),
            Spacer()
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
