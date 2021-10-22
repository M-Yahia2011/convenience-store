import 'package:flutter/material.dart';
import '../helpers/colors.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView(
          addAutomaticKeepAlives: true,
          // shrinkWrap: true,
          // restorationId: "0",
          scrollDirection: Axis.horizontal,
          children: List.generate(
            10,
            (index) => GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: MyColors.colors,
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Image.asset(
                      "assets/images/bb.png",
                      isAntiAlias: true,
                    ),
                  ),
                  Text(
                    index.toString(),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
