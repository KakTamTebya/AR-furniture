import 'package:flutter/material.dart';
import 'package:ar_furniture/models/furniture_item.dart';
import 'package:ar_furniture/constants.dart';
import 'item_card.dart';
import 'package:ar_furniture/ui/pages/details/details_page.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';

class HomePageBody extends StatelessWidget {
  final List<FurnitureItem> items;
  final String gridViewKey;
  const HomePageBody({required this.items, required this.gridViewKey, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            kDefaultPadding, kDefaultPadding / 2, kDefaultPadding, 0),
        child: DynamicHeightGridView(
          key: PageStorageKey(gridViewKey),
          itemCount: items.length,
          crossAxisCount: 2,
          crossAxisSpacing: kDefaultPadding,
          mainAxisSpacing: kDefaultPadding / 2,
          builder: (context, index) => ItemCard(
            cardInfo: items[index],
            press: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage(furnitureItem: items[index])),
            ),
          ),
        ),
      ),
    );
  }
}
