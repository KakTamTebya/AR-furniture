import 'package:flutter/material.dart';

class TextElevatedButton extends StatelessWidget {
  final void Function()? function;
  final String text;
  final double? fontSize;
  final Color? textColor;
  final double circularBorderRadius;

  const TextElevatedButton({
    required this.function,
    required this.text,
    this.fontSize,
    this.textColor,
    this.circularBorderRadius = 16,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        surfaceTintColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularBorderRadius),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
        ),
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.clip,
        softWrap: true,
      ),
    );
  }
}