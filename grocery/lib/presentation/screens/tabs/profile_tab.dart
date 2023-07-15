import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '/presentation/screens/shipping_address_screen.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // hack for the line under the appbar
        toolbarHeight: kToolbarHeight + 1.25,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: MediaQuery.sizeOf(context).height / 3.8,
          ),
          const Column(
            children: [
              ProfilePicture(
                  imgUrl:
                      "https://t3.ftcdn.net/jpg/02/77/57/98/360_F_277579821_fS4K3BDHVlMYzw7EZppPeWU6qMrZS6Nx.jpg"),
              SizedBox(height: 16),
              Text("m.yahia.eid2011@gmail.com",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold))
            ],
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height / 5.5,
            left: 1,
            right: 1,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 3.2,
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
                                routeName: ShippingAddressScreen.routeName),
                            Divider(height: 0),
                            ProfileListTile(
                                text: "Payment Method",
                                icon: Icons.payment_rounded,
                                routeName: ""),
                            Divider(height: 0),
                            ProfileListTile(
                                text: "Order History",
                                icon: Icons.menu,
                                routeName: ""),
                            Divider(height: 0),
                            ProfileListTile(
                                text: "Delivary Status",
                                icon: Icons.call_received_rounded,
                                routeName: ""),
                            Divider(height: 0),
                            ProfileListTile(
                                text: "Language",
                                icon: Icons.language_rounded,
                                routeName: ""),
                          ]),
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
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
                            Divider(height: 0),
                            ProfileListTile(
                                text: "FAQ",
                                icon: Icons.payment_rounded,
                                routeName: ""),
                            Divider(height: 0),
                            ProfileListTile(
                                text: "About Us",
                                icon: Icons.menu,
                                routeName: ""),
                            Divider(height: 0),
                            ProfileListTile(
                              icon: Icons.star_border_rounded,
                              text: "Rate Our App",
                              routeName: "",
                            ),
                          ]),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 5,
            right: 0,
            left: 0,
            child: Container(
                width: double.infinity,
                height: 55,
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Log Out",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ))),
          ),
          // had to put a column to make the stack cover the entire body height
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
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(routeName);
        },
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 16,
            ),
            Text(text),
          ],
        ),
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
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2.5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                fit: BoxFit.fitHeight,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        )
      ],
    );
  }
}
