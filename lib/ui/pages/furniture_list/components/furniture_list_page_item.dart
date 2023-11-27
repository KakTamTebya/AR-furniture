import 'package:flutter/material.dart';
import 'package:ar_furniture/constants.dart';
import 'package:ar_furniture/models/furniture_item.dart';

class FurnitureListPageItem extends StatelessWidget {
  final FurnitureItem furnitureItem;
  final VoidCallback press;
  const FurnitureListPageItem({
    required this.furnitureItem,
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
            borderRadius: BorderRadius.circular(defaultCircularRadius),
            child: Image.network(furnitureItem.menuImageUrl), // mock
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
            child: Text(
              furnitureItem.name,
              style: const TextStyle(
                  color: Colors.black,
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
