import 'package:flutter/material.dart';
import 'package:grocery_store/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: MyColors.colors[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Column(
                children: [
                  Text(
                    "Delivery Adress",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: Colors.grey),
                  ),
                  Text("10, Abbas st"),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search_rounded,
                      size: 30,
                    )),
              ],
            ),
            SliverToBoxAdapter(child: AdContainer()),
            SliverToBoxAdapter(
              child: SubtitleAndTextButtonRow(
                subtitle: "Explore by Categories",
                buttonText: "View All",
                route: "",
              ),
            ),
            SliverToBoxAdapter(child: CategoriesBar()),
            SliverToBoxAdapter(
              child: SubtitleAndTextButtonRow(
                subtitle: "Products",
                buttonText: "View All",
                route: "",
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 30,
              ),
              delegate: SliverChildBuilderDelegate((ctx, idx) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Placeholder()),
                        Text("itemName"),
                        Text("itemPrice")
                      ],
                    ),
                  )),
            ),
          ]),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

class SubtitleAndTextButtonRow extends StatelessWidget {
  final String subtitle;
  final String buttonText;
  final String route;
  const SubtitleAndTextButtonRow(
      {Key? key,
      required this.buttonText,
      required this.subtitle,
      required this.route})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(subtitle),
        TextButton(
            onPressed: () {
              // nav to route
            },
            child: Text(buttonText))
      ],
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: MyColors.colors,
            ),
            child: Text('Hello Mohamed'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView(
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
                    child: Placeholder(),
                  ),
                  Text(
                    "ItemName",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class AdContainer extends StatelessWidget {
  const AdContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        height: 130,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: MyColors.colors),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Text("AD title"), Text("Ad tile"), Text("Order now >")],
        ),
      ),
      Positioned(
          right: 10,
          top: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(blurRadius: 5, color: Colors.black54, spreadRadius: 0)
            ]),
            child: CircleAvatar(
              radius: 80,
              backgroundColor: MyColors.colors[50],
            ),
          )),
    ]);
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.reorder_rounded,
              size: 30,
            )),
        Column(
          children: [
            Text(
              "Delivery Adress",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Colors.grey),
            ),
            Text("10, Abbas st"),
          ],
        ),
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
              size: 30,
            )),
      ],
    );
  }
}
