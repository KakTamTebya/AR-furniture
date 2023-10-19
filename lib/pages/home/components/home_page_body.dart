import 'package:flutter/material.dart';
import 'package:ar_furniture/models/furniture_item.dart';
import 'package:ar_furniture/constants.dart';
import 'item_card.dart';
import 'package:ar_furniture/pages/details/details_page.dart';

class HomePageBody extends StatelessWidget {
  final List<FurnitureItem> items;
  const HomePageBody({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            kDefaultPadding,
            kDefaultPadding / 2,
            kDefaultPadding,
            0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: kDefaultPadding / 2,
              crossAxisSpacing: kDefaultPadding,
              crossAxisCount: 2,
              childAspectRatio: 0.74),
          itemBuilder: (context, index) => ItemCard(
              cardInfo: items[index],
              press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsPage(
                              furnitureItem: items[index])),
              )),
        ),
      ),
    );
  }
}
