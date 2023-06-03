import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final FontStyle fontStyle;

  const CustomText(
    this.text, {
    super.key,
    this.color = Colors.black,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.textAlign,
    this.fontStyle = FontStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      ),
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
