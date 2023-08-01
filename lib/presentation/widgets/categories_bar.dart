import 'package:flutter/material.dart';
import 'package:grocery_store/utils/theme_constants.dart';
import '../../data/models/category.dart';
import '/../helpers/data.dart';
import '/../presentation/screens/category_screen.dart';

/// Horizontal Listview of The Categories
class CategoriesBar extends StatelessWidget {
  const CategoriesBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        addAutomaticKeepAlives: true,
        // shrinkWrap: true,
        // restorationId: "0",
        scrollDirection: Axis.horizontal,
        itemCount: Data.categories.length,
        itemBuilder: (ctx, idx) => CategoryBarItem(Data.categories[idx]),
      ),
    );
  }
}

class CategoryBarItem extends StatelessWidget {
  final Category _category;
  const CategoryBarItem(
    this._category, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(CategoryScreen.routeName, arguments: _category.id);
      },
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              // color: MyColors.colors,
              border:
                  Border.all(color: ThemeConstants.mainColor.withOpacity(0.5)),
            ),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  ThemeConstants.mainColor.withOpacity(0.6), BlendMode.srcATop),
              child: Image.asset(
                _category.iconPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            _category.name,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.bold,color: ThemeConstants.textColor),
          ),
        ],
      ),
    );
  }
}
