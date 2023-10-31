import 'package:flutter/material.dart';
import 'package:ar_furniture/constants.dart';
import 'package:ar_furniture/models/furniture_item.dart';
import 'components/details_page_body.dart';

class DetailsPage extends StatelessWidget {
  final FurnitureItem furnitureItem;

  const DetailsPage({required this.furnitureItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp, color: kBottomNavBarColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          furnitureItem.name,
          style: const TextStyle(
            color: kTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 1,
              color: kBottomNavBarColor.withOpacity(0.7),
              width: 56,
            ),
          ),
        ),
      ),
      body: DetailsPageBody(furnitureItem: furnitureItem),
    );
  }
}
