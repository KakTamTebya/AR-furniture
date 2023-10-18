import 'package:flutter/material.dart';
import 'package:ar_furniture/constants.dart';
import 'package:ar_furniture/models/furniture_item.dart';

class ItemCard extends StatelessWidget {
  final FurnitureItem cardInfo;
  // final Function press;
  const ItemCard({
    required this.cardInfo,
    // required this.press,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(26),
          child: Image.network(cardInfo.imageUrl), // mock
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: Text(
              cardInfo.name,
              style: const TextStyle(color: kTextColor),
              softWrap: true,
              overflow: TextOverflow.clip,
            ),
          ),
        ),
      ],
    );
  }
}
