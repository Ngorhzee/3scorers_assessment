import 'package:flutter/material.dart';
import 'package:livesscore/core/constants/text_styles.dart';

class AppText extends StatelessWidget {
   AppText.headlineLarge(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontfamily, this.decoration,
  })  : style = headingLarge.copyWith(
          color: color,
          fontSize: fontSize,
          height: height,
          decoration: decoration,
          letterSpacing: letterSpacing,
          fontFamily: fontfamily,
          wordSpacing: wordSpacing,
          fontWeight: fontWeight,
        );
  AppText.headlineMedium(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontfamily, this.decoration,
  })  : style = headingMedium.copyWith(
          color: color,
          fontSize: fontSize,
          decoration: decoration,
          height: height,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          fontWeight: fontWeight,
          fontFamily: fontfamily,
        );
 AppText.labelLarge(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontfamily, this.decoration,
  })  : style = labelLarge.copyWith(
          color: color,
          fontSize: fontSize,
          height: height,
          fontFamily: fontfamily,
          decoration: decoration,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          fontWeight: fontWeight,
        );
  AppText.labelMedium(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontfamily, this.decoration,
  })  : style = labelMedium.copyWith(
          color: color,
          fontSize: fontSize,
          decoration: decoration,
          height: height,
          fontFamily: fontfamily,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          fontWeight: fontWeight,
        );
  AppText.labelSmall(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontfamily, this.decoration,
  })  : style = labelSmall.copyWith(
          color: color,
          fontSize: fontSize,
          height: height,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          fontWeight: fontWeight,
          fontFamily: fontfamily,
        );
        AppText.bodyLarge(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontfamily, this.decoration,
  })  : style = bodyLarge.copyWith(
          color: color,
          fontSize: fontSize,
          height: height,
          fontFamily: fontfamily,
          decoration: decoration,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          fontWeight: fontWeight,
        );
  AppText.bodyMedium(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontfamily, this.decoration,
  })  : style = bodyMedium.copyWith(
          color: color,
          fontSize: fontSize,
          fontFamily: fontfamily,
          decoration:decoration ,
          height: height,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          fontWeight: fontWeight,
        );
  AppText.bodySmall(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontfamily, this.decoration,
  })  : style = bodySmall.copyWith(
          color: color,
          fontSize: fontSize,
          fontFamily: fontfamily,
          decoration: decoration,
          height: height,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          fontWeight: fontWeight,
        );
 final String text;
  final TextStyle style;
  final bool multiText;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final Color? color;
  final bool centered;
  final int? maxLines;
  final double? fontSize;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final String? fontfamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: multiText || maxLines != null ? maxLines ?? 9999999999 : 1,
      overflow: overflow,
      textAlign: centered ? TextAlign.center : textAlign ?? TextAlign.left,
      style: style,
    );
  }
}