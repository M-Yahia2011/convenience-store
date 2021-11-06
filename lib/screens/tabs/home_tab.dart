import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_store/screens/item_details_screen.dart';
import 'package:grocery_store/widgets/exit_dialogue.dart';
import 'package:provider/provider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '/helpers/data.dart';
import '/models/item.dart';
import '/providers/products_provider.dart';
import '/screens/all_products_screen.dart';
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
  bool _isSearching = false;
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  bool _isDrawerOpened = false;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      // on dismissing the keyboard
      print("HELLLLLLLLLLLLOOOOO");
      if (_focusNode.hasPrimaryFocus == false) {
        setState(() {
          _isSearching = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<Iterable<Item>> getSearchSuggestions(String query) async {
    try {
      String queryLower = query.toLowerCase();

      return Data.allItems
          .where((item) => item.name.toLowerCase().contains(queryLower))
          .toList();
    } catch (e) {
      throw "problem";
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_isDrawerOpened == true) {
          Navigator.of(context).pop();
          return Future.value(false);
        }
        return ExitAlert(context);
      },
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        onDrawerChanged: (isOpened) => _isDrawerOpened = isOpened,
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              // _isSearching = false;
              FocusManager.instance.primaryFocus!.unfocus();
              setState(() {
                _textEditingController.clear();
                _isSearching = false;
              });
              // FocusScope.of(context).unfocus();
            }
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomScrollView(slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  systemOverlayStyle:
                      SystemUiOverlayStyle(statusBarColor: Colors.white),
                  elevation: 0,
                  title: _isSearching == true
                      ? TypeAheadField<Item>(
                          textFieldConfiguration: TextFieldConfiguration(
                            focusNode: _focusNode,
                            autofocus: true,
                            controller: _textEditingController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search for an item",
                              alignLabelWithHint: true,
                            ),
                          ),
                          onSuggestionSelected: (item) {
                            _isSearching = false;
                            Navigator.of(context).pushNamed(
                                ItemDetailsScreen.routeName,
                                arguments: item);
                          },
                          suggestionsCallback: (query) async =>
                              getSearchSuggestions(query),
                          noItemsFoundBuilder: (ctx) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "No item was found",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          itemBuilder: (context, suggestedItem) {
                            return ListTile(
                              leading: Image.asset(suggestedItem.image),
                              title: Text(suggestedItem.name),
                              // subtitle: Text('subtitle'),
                            );
                          },
                          debounceDuration: Duration(milliseconds: 500),
                          suggestionsBoxDecoration: SuggestionsBoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8)),
                          ),
                        )
                      : Column(
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
                        onPressed: () {
                          setState(() {
                            _isSearching = true;
                          });
                        },
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
                    route: CategoriesTableScreen.routeName,
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
                Consumer<ProductsProvider>(
                  builder: (ctx, provider, _) => SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.portrait
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
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
