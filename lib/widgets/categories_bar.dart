import 'package:flutter/material.dart';
import '../helpers/colors.dart';
import '../helpers/data.dart';

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
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: MyColors.colors,
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Image.asset(
              _category.iconPath,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            _category.name,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
