import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? lightColor;
  final Color? darkColor;
  final FontWeight? fontWeight;

  const AppText(
      {Key? key, required this.text, this.fontSize, this.lightColor, this.darkColor, this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
