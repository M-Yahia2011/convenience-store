import 'package:flutter/material.dart';

import '../screens/orders_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: Column(children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 50, 8, 20),
                  child: Text(
                    'Grocery App',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                DrawerTile(
                  icon: Icons.shopping_bag,
                  title: 'My Orders',
                  function: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(OrdersScreen.routeName);
                  },
                ),
                const DrawerTile(icon: Icons.help_outline_rounded, title: 'Help'),
                const DrawerTile(icon: Icons.info_outline_rounded, title: 'About us'),
              ],
            ),
          ),
          DrawerTile(
            icon: Icons.exit_to_app,
            title: 'LOGOUT',
            function: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("HELLOOOOOOOOOOO")));
            },
          ),
        ]),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? function;
  const DrawerTile(
      {Key? key, required this.icon, required this.title, this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: title == "LOGOUT" ? Colors.red[400] : Colors.amber,
      child: ListTile(
        leading: Icon(
          icon,
          color: title == "LOGOUT" ? Colors.white : Colors.black,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: title == "LOGOUT" ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        onTap: function,
      ),
    );
  }
}
