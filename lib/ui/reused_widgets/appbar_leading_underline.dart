import 'package:flutter/material.dart';

class AppBarLeadingUnderline extends StatelessWidget {

  final Color? color;

  final double width;

  const AppBarLeadingUnderline({
    super.key,
    this.color,
    this.width = 56,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 1,
        color: color ?? theme.primaryColor.withOpacity(0.7),
        width: width,
      ),
    );
  }
}