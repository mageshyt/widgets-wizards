import 'package:flutter/material.dart';
import 'package:widgets_wigets/common/colors.dart';

import 'package:widgets_wigets/common/sizes.dart';

enum TexSizes { small, medium, large }

enum BadgeSizes { sm, md, lg }

enum BadgeVariants { success, primary, error }

// Ensure this path is correct

class CustomIconWithBadge extends StatelessWidget {
  final IconData icon;
  final BadgeSizes size;
  final BadgeVariants? variant;

  const CustomIconWithBadge({
    super.key,
    required this.icon,
    this.size = BadgeSizes.md,
    this.variant = BadgeVariants.primary,
  });

  @override
  Widget build(BuildContext context) {
    double iconSize;
    Color badgeColor;
    Color iconColor;

    switch (size) {
      case BadgeSizes.sm:
        iconSize = Sizes.iconSm;
        break;
      case BadgeSizes.md:
        iconSize = Sizes.iconMd;
        break;
      case BadgeSizes.lg:
        iconSize = Sizes.iconLg;
        break;
      default:
        iconSize = Sizes.iconMd;
    }

    switch (variant) {
      case BadgeVariants.primary:
        badgeColor = ThemeColors.primary.withOpacity(0.25);
        iconColor = ThemeColors.primary;

        break;
      case BadgeVariants.success:
        badgeColor = Colors.lightGreen.withOpacity(0.25);
        iconColor = ThemeColors.success;

        break;
      case BadgeVariants.error:
        badgeColor = ThemeColors.error.withOpacity(0.25);
        iconColor = ThemeColors.error;

        break;
      default:
        badgeColor = ThemeColors.secondary.withOpacity(0.3);
        iconColor = ThemeColors.secondary;
    }

    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(Sizes.sm),
        decoration: BoxDecoration(
          color: badgeColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor, // Change this as per your color scheme
        ),
      ),
    );
  }
}
