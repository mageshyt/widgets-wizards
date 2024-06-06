import 'package:flutter/material.dart';
import 'package:widgets_wigets/common/colors.dart';
import 'package:widgets_wigets/common/sizes.dart';

enum BadgeVariant { primary, secondary, outline, destructive }

class CustomBadge extends StatelessWidget {
  final String text;
  final BadgeVariant variant;

  const CustomBadge({
    Key? key,
    required this.text,
    this.variant = BadgeVariant.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor;
    Color? textColor;
    Color? borderColor;

    switch (variant) {
      case BadgeVariant.primary:
        backgroundColor = ThemeColors.primary;
        textColor = ThemeColors.white;
        borderColor = ThemeColors.primary;
        break;
      case BadgeVariant.secondary:
        backgroundColor = ThemeColors.darkGrey;
        textColor = ThemeColors.white;
        borderColor = ThemeColors.darkGrey;
        break;
      case BadgeVariant.outline:
        backgroundColor = ThemeColors.white;
        textColor = ThemeColors.primary;
        borderColor = ThemeColors.primary;
        break;
      case BadgeVariant.destructive:
        backgroundColor = ThemeColors.error;
        textColor = ThemeColors.white;
        borderColor = ThemeColors.error;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: Sizes.fontSizeMd,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
