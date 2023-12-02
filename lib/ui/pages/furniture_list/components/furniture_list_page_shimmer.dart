import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ar_furniture/constants.dart';

class FurnitureListPageShimmer extends StatelessWidget {

  const FurnitureListPageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Shimmer.fromColors(
      baseColor: theme.hintColor,
      highlightColor: Colors.grey,
      period: const Duration(milliseconds: 1800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.width - defaultPadding * 3) / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultCircularRadius),
              color: theme.hintColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultCircularRadius / 6),
                    color: theme.hintColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 14,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultCircularRadius / 6),
                    color: theme.hintColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
