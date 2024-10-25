import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ScaleFactorAutoSizeText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? minFontSize;
  final double? maxFontSize;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool? softWrap;
  final TextDirection? textDirection;
  const ScaleFactorAutoSizeText({
    super.key,
    required this.text,
    this.style,
    this.minFontSize,
    this.maxFontSize,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.softWrap,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    double textScaleFactor = 1;
    return AutoSizeText(
      text,
      style: style,
      minFontSize: minFontSize ?? 12,
      maxFontSize: maxFontSize ?? double.infinity,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
      softWrap: softWrap,
      textDirection: textDirection,
    );
  }
}
