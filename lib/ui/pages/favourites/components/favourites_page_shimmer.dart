import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ar_furniture/constants.dart';

class FavouritesPageShimmer extends StatelessWidget {

  const FavouritesPageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Shimmer.fromColors(
          baseColor: theme.hintColor,
          highlightColor: Colors.grey,
          period: const Duration(milliseconds: 2500),
          child: Container(
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 7),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultCircularRadius),
              color: theme.hintColor,
            ),
          )
        ),
        Shimmer.fromColors(
          baseColor: theme.hintColor,
          highlightColor: Colors.grey,
          period: const Duration(milliseconds: 1000),
          child: Container(
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 7),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultCircularRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(defaultCircularRadius),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Container(
                    height: 34,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(defaultCircularRadius / 2),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Icon(
                  Icons.favorite,
                  size: 35,
                  color: Colors.grey[800],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
