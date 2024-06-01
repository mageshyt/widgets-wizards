import 'package:flutter/material.dart';
import 'package:widgets_wigets/common/colors.dart';
import 'package:widgets_wigets/common/sizes.dart';

class ButtonStyles {
  static final Map<String, ButtonStyle> variants = {
    'default': ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(ThemeColors.primary),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      overlayColor: MaterialStateProperty.all<Color>(
          ThemeColors.primary.withOpacity(0.8)),
    ),
    'destructive': ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(ThemeColors.error),
      foregroundColor: MaterialStateProperty.all<Color>(ThemeColors.white),
      overlayColor:
          MaterialStateProperty.all<Color>(ThemeColors.error.withOpacity(0.8)),
    ),
    'outline': ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(ThemeColors.textPrimary),
      foregroundColor: MaterialStateProperty.all<Color>(ThemeColors.black),
      side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: ThemeColors.black)),
      overlayColor: MaterialStateProperty.all<Color>(
          ThemeColors.darkGrey.withOpacity(0.2)),
    ),
    'secondary': ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(ThemeColors.darkGrey),
      foregroundColor: MaterialStateProperty.all<Color>(ThemeColors.white),
      overlayColor: MaterialStateProperty.all<Color>(
          ThemeColors.darkGrey.withOpacity(0.8)),
    ),
    'ghost': ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(ThemeColors.textPrimary),
      foregroundColor: MaterialStateProperty.all<Color>(ThemeColors.black),
      overlayColor: MaterialStateProperty.all<Color>(
          ThemeColors.darkGrey.withOpacity(0.2)),
    ),
    'link': ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(ThemeColors.textPrimary),
      foregroundColor: MaterialStateProperty.all<Color>(ThemeColors.primary),
      overlayColor: MaterialStateProperty.all<Color>(
          ThemeColors.primary.withOpacity(0.2)),
    ),
  };

  static const Map<String, EdgeInsetsGeometry> sizes = {
    'default': EdgeInsets.symmetric(horizontal: Sizes.md, vertical: Sizes.sm),
    'sm': EdgeInsets.symmetric(horizontal: Sizes.md, vertical: Sizes.sm),
    'lg': EdgeInsets.symmetric(horizontal: Sizes.lg, vertical: Sizes.md),
    'icon': EdgeInsets.all(Sizes.sm),
  };
}
