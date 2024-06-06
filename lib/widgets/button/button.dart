import 'package:flutter/material.dart';
import 'package:widgets_wigets/common/colors.dart';
import 'package:widgets_wigets/common/sizes.dart';

// Enums for button variants and sizes
enum ButtonVariant {
  defaultVariant,
  destructive,
  outline,
  secondary,
  ghost,
  link,
}

enum ButtonSize {
  defaultSize,
  sm,
  lg,
  icon,
}

class ShadcnButton extends StatelessWidget {
  final ButtonVariant variant;
  final ButtonSize size;
  final Widget? icon;
  final Widget? label;
  final String? text; // Optional button text
  final void Function()? onPressed;
  final ButtonStyle? customStyle; // Optional custom style

  const ShadcnButton({
    Key? key,
    this.variant = ButtonVariant.defaultVariant,
    this.size = ButtonSize.defaultSize,
    this.icon,
    this.label,
    this.text,
    this.onPressed,
    this.customStyle, // Accepts custom style
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get button style based on variant and size
    final buttonStyle = _getButtonStyle(context, variant, size)
        .merge(customStyle); // Merge custom style with variant style

    // Render appropriate button based on variant
    switch (variant) {
      case ButtonVariant.outline:
        return OutlinedButton(
          onPressed: onPressed,
          style: buttonStyle,
          child: _buildChild(),
        );
      case ButtonVariant.ghost:
      case ButtonVariant.link:
        return TextButton(
          onPressed: onPressed,
          style: buttonStyle,
          child: _buildChild(),
        );
      default:
        return ElevatedButton(
          onPressed: onPressed,
          style: buttonStyle,
          child: _buildChild(),
        );
    }
  }

  // Get button style based on variant and size
  ButtonStyle _getButtonStyle(
      BuildContext context, ButtonVariant variant, ButtonSize size) {
    // Define base button style with common properties
    final baseStyle = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.borderRadiusSm),
        ),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(fontSize: _getFontSize(size))), // Use theme's text style
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(_getPadding(size)),
    );

    // Apply variant-specific styles
    switch (variant) {
      case ButtonVariant.defaultVariant:
        return baseStyle.copyWith(
          backgroundColor:
              MaterialStateProperty.all<Color>(ThemeColors.primary),
          foregroundColor: MaterialStateProperty.all<Color>(ThemeColors.white),
          overlayColor: MaterialStateProperty.all<Color>(
              ThemeColors.primary.withOpacity(0.8)),
        );
      case ButtonVariant.destructive:
        return baseStyle.copyWith(
          backgroundColor: MaterialStateProperty.all<Color>(ThemeColors.error),
          foregroundColor: MaterialStateProperty.all<Color>(ThemeColors.white),
          overlayColor: MaterialStateProperty.all<Color>(
              ThemeColors.error.withOpacity(0.8)),
        );
      case ButtonVariant.outline:
        return baseStyle.copyWith(
          backgroundColor: MaterialStateProperty.all<Color>(ThemeColors.white),
          foregroundColor: MaterialStateProperty.all<Color>(ThemeColors.black),
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(color: ThemeColors.black),
          ),
          overlayColor: MaterialStateProperty.all<Color>(
              ThemeColors.darkGrey.withOpacity(0.2)),
          elevation:
              MaterialStateProperty.all<double>(0), // Set elevation to zero
        );

      case ButtonVariant.secondary:
        return baseStyle.copyWith(
          backgroundColor: MaterialStateProperty.all<Color>(ThemeColors.black),
          foregroundColor: MaterialStateProperty.all<Color>(ThemeColors.white),
          overlayColor: MaterialStateProperty.all<Color>(
              ThemeColors.darkGrey.withOpacity(0.8)),
        );
      case ButtonVariant.ghost:
        return baseStyle.copyWith(
          backgroundColor:
              MaterialStateProperty.all<Color>(ThemeColors.textPrimary),
          foregroundColor: MaterialStateProperty.all<Color>(ThemeColors.black),
          elevation: MaterialStateProperty.all<double>(0),
          overlayColor:
              MaterialStateProperty.all<Color>(ThemeColors.textPrimary),
        );
      case ButtonVariant.link:
        return baseStyle.copyWith(
          backgroundColor:
              MaterialStateProperty.all<Color>(ThemeColors.textPrimary),
          foregroundColor:
              MaterialStateProperty.all<Color>(ThemeColors.primary),
          overlayColor:
              MaterialStateProperty.all<Color>(ThemeColors.textPrimary),
        );
      default:
        return baseStyle;
    }
  }

  // Get padding based on button size
  EdgeInsetsGeometry _getPadding(ButtonSize size) {
    switch (size) {
      case ButtonSize.defaultSize:
        return const EdgeInsets.symmetric(
            horizontal: Sizes.md, vertical: Sizes.sm);
      case ButtonSize.sm:
        return const EdgeInsets.symmetric(
            horizontal: Sizes.md, vertical: Sizes.sm);
      case ButtonSize.lg:
        return const EdgeInsets.symmetric(
            horizontal: Sizes.lg, vertical: Sizes.md);
      case ButtonSize.icon:
        return const EdgeInsets.all(Sizes.sm);
      default:
        return const EdgeInsets.symmetric(
            horizontal: Sizes.md, vertical: Sizes.sm);
    }
  }

  // Get font size based on button size
  double _getFontSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.defaultSize:
        return Sizes.md;
      case ButtonSize.sm:
        return Sizes.sm;
      case ButtonSize.lg:
        return Sizes.lg;
      case ButtonSize.icon:
        return Sizes.sm;
      default:
        return Sizes.md;
    }
  }

  // Build child widget (text, icon, or label)
  Widget _buildChild() {
    if (text != null) {
      return Text(text!);
    } else if (icon != null && label != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon!,
          const SizedBox(width: 8), // Adjust the spacing between icon and label
          label!,
        ],
      );
    } else {
      return Container(); // Return an empty container if no child, icon, or label
    }
  }
}
