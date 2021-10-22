import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_store/helpers/colors.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // systemOverlayStyle:
        //     SystemUiOverlayStyle(statusBarColor: MyColors.colors),
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            height: 150,
            child: Row(
              children: [
                Card(
                  // color: Colors.transparent,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      "https://t3.ftcdn.net/jpg/02/77/57/98/360_F_277579821_fS4K3BDHVlMYzw7EZppPeWU6qMrZS6Nx.jpg",
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Text(
                        "Mohamed Yahia",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text("m.y2000@gmail.com"),
                      Text("+201909090909"),
                      Expanded(
                          child: TextButton.icon(
                        onPressed: () {},
                        label: Text("Edit Profile"),
                        icon: Icon(Icons.edit),
                      ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
