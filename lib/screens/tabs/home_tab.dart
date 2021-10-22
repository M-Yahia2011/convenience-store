import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_store/providers/products_provider.dart';
import 'package:grocery_store/screens/all_products_screen.dart';
import 'package:provider/provider.dart';
import '/helpers/colors.dart';
import '/widgets/ads_container.dart';
import '/widgets/categories_bar.dart';
import '/widgets/custom_drawer.dart';
import '/widgets/presented_item.dart';
import '/widgets/subtitle_textbutton_row.dart';
import '../categories_table_screen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: MyColors.colors[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomScrollView(slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: MyColors.colors),
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
            SliverToBoxAdapter(
              child: AdContainer(),
            ),
            SliverToBoxAdapter(
              child: SubtitleAndTextButtonRow(
                subtitle: "Explore by Categories",
                buttonText: "View All",
                route: CategoriesScreen.routeName,
              ),
            ),
            SliverToBoxAdapter(
              child: CategoriesBar(),
            ),
            SliverToBoxAdapter(
              child: SubtitleAndTextButtonRow(
                subtitle: "Products",
                buttonText: "View All",
                route: AllProductsScreen.routeName,
              ),
            ),
            Consumer<ItemProvider>(
              builder: (ctx, provider, _) => SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 2
                          : 3,
                  childAspectRatio: 1 / 1.3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 30,
                ),
                delegate: SliverChildBuilderDelegate(
                    (ctx, idx) => PresentedItem(provider.items[idx]),
                    childCount: provider.items.length),
              ),
            ),
          ]),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
