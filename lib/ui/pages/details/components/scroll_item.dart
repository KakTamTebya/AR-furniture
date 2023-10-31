import 'package:flutter/material.dart';
import 'package:ar_furniture/constants.dart';

class ScrollItem extends StatelessWidget {
  final String imageUrl;

  const ScrollItem({
    super.key,
    required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(kCircularRadius),
        boxShadow: [
          BoxShadow(
            color: kBottomNavBarColor.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(3, 5),
          ),
        ]
      ),
    );
  }
}
