import 'package:flutter/material.dart';

class ButtonMaterial extends StatelessWidget {
  const ButtonMaterial(
      {required this.elevation,
      required this.borderRadius,
      required this.verticalPadding,
      required this.color,
      required this.text,
      required this.minWidth,
      required this.height,
      required this.onPressed});

  final double elevation;
  final double borderRadius;
  final double verticalPadding;
  final Color color;
  final String text;
  final double minWidth;
  final double height;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Material(
        elevation: elevation,
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: minWidth,
          height: height,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
