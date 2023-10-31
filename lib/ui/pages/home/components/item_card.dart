import 'package:flutter/material.dart';
import 'package:ar_furniture/constants.dart';
import 'package:ar_furniture/models/furniture_item.dart';

class ItemCard extends StatelessWidget {
  final FurnitureItem cardInfo;
  final VoidCallback press;
  const ItemCard({
    required this.cardInfo,
    required this.press,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(kCircularRadius),
            child: Image.network(cardInfo.menuImageUrl), // mock
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: Text(
              cardInfo.name,
              style: const TextStyle(
                  color: kTextColor,
                  fontSize: 14),
              softWrap: true,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}
