import 'package:flutter/material.dart';
import 'package:grocery_store/helpers/colors.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            color: MyColors.colors,
            height: MediaQuery.sizeOf(context).height / 4,
            width: double.infinity,
            child: const Row(
              children: [
                ProfilePicture(
                    imgUrl:
                        "https://t3.ftcdn.net/jpg/02/77/57/98/360_F_277579821_fS4K3BDHVlMYzw7EZppPeWU6qMrZS6Nx.jpg"),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Mohamed Yahia"),
                    SizedBox(
                      height: 8,
                    ),
                    Text("m.yahia.eid2011@gmail.com")
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height / 5,
            left: 1,
            right: 1,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(children: [
                            ProfileListTile(
                                text: "Shipping Address",
                                icon: Icons.location_pin,
                                routeName: ""),
                            Divider(),
                            ProfileListTile(
                                text: "Payment Method",
                                icon: Icons.payment_rounded,
                                routeName: ""),
                            Divider(),
                            ProfileListTile(
                                text: "Order History",
                                icon: Icons.menu,
                                routeName: ""),
                            Divider(),
                            ProfileListTile(
                                text: "Delivary Status",
                                icon: Icons.call_received_rounded,
                                routeName: ""),
                            Divider(),
                            ProfileListTile(
                                text: "Language",
                                icon: Icons.language_rounded,
                                routeName: ""),
                          ]),
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 3.7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        // margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(children: [
                            ProfileListTile(
                                text: "Privacy Policy",
                                icon: Icons.location_pin,
                                routeName: ""),
                            Divider(),
                            ProfileListTile(
                                text: "FAQ",
                                icon: Icons.payment_rounded,
                                routeName: ""),
                            Divider(),
                            ProfileListTile(
                                text: "About Us",
                                icon: Icons.menu,
                                routeName: ""),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.star_border_rounded),
                              title: Text("Rate Our App"),
                            ),
                          ]),
                        )),
                  ),
                ),
              ],
            ),
          ),
          // had to put a column to make the stack cover the entire body
          const Column(),
        ],
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile(
      {Key? key,
      required this.text,
      required this.icon,
      required this.routeName})
      : super(key: key);
  final String text;
  final IconData icon;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 16,
          ),
          Text(text),
        ],
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                imgUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        )
      ],
    );
  }
}
