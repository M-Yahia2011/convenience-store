import 'package:flutter/material.dart';
import '../helpers/colors.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: EdgeInsets.symmetric(vertical: 5),
      color: MyColors.colors[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            // height: 200,
            width: 180,
            child: Image.asset(
              "assets/images/bb.png",
            ),
          ),
          Column(
            children: [
              Text("Item Name"),
              Text("Item description"),
              SizedBox(height: 100),
              Text(
                "7.00\$/litre",
                style: TextStyle(color: MyColors.colors[50]),
              )
            ],
          ),
          Container(
              width: 30,
              height: 120,
              decoration: BoxDecoration(
                  color: Color(0xffF0F0F0),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: CircleAvatar(
                      backgroundColor: MyColors.colors,
                      radius: 15,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        color: Colors.black,
                        icon: Icon(Icons.add),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Text("100", style: Theme.of(context).textTheme.subtitle1),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.black,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        // color: Colors.white,
                        icon: Icon(Icons.remove),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
