import 'package:flutter/material.dart';
import 'package:ar_furniture/models/furniture_item.dart';
import 'package:ar_furniture/constants.dart';
import 'item_card.dart';

class PageBody extends StatelessWidget {
  final List<FurnitureItem> items;
  const PageBody({required this.items, super.key});

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
          itemBuilder: (context, index) => ItemCard(cardInfo: items[index]),
        ),
      ),
    );
  }
}
