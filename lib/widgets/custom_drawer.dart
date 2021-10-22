import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
              child: Text(
                'Grocery App',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            DrawerTile(),
            DrawerTile(),
            DrawerTile(),
            DrawerTile(),
            DrawerTile(),
            DrawerTile(),
            DrawerTile(),
            DrawerTile(),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      child: ListTile(
        leading: Icon(
          Icons.home_rounded,
          color: Colors.black,
        ),
        title: const Text(
          'Item 1',
        ),
        onTap: () {},
      ),
    );
  }
}
