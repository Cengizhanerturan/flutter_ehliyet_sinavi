// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ScaleFactorText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDirection? textDirection;
  const ScaleFactorText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    double textScaleFactor = 1;
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      textScaleFactor: textScaleFactor,
      textDirection: textDirection,
    );
  }
}
