import 'package:flutter/material.dart';
import 'package:ar_furniture/constants.dart';

class PageViewIndicator extends StatelessWidget {
  final int pagesCount;
  final int currentPageIndex;

  const PageViewIndicator(
      {super.key, required this.pagesCount, required this.currentPageIndex});

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(
        microseconds: 150,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultCircularRadius),
        color: isActive ? Colors.white : Colors.white24,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(defaultCircularRadius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < pagesCount; i++)
              _indicator(i == currentPageIndex ? true : false)
          ],
        ),
      ),
    );
  }
}
