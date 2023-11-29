import 'package:flutter/material.dart';
import 'package:ar_furniture/constants.dart';
import 'package:ar_furniture/domain/models/furniture_item.dart';
import 'package:ar_furniture/ui/routes/router.dart';
import 'package:auto_route/auto_route.dart';

class FurnitureListPageItem extends StatelessWidget {

  final FurnitureItem furnitureItem;

  const FurnitureListPageItem({
    required this.furnitureItem,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(DetailsRoute(
          furnitureItem: furnitureItem)),
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
