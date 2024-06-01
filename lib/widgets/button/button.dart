import 'package:flutter/material.dart';

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
    required this.variant,
    required this.size,
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
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(fontSize: _getFontSize(size))), // Use theme's text style
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(_getPadding(size)),
      elevation: MaterialStateProperty.all<double>(2),
    );

    // Apply variant-specific styles
    switch (variant) {
      case ButtonVariant.defaultVariant:
        return baseStyle.copyWith(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          overlayColor:
              MaterialStateProperty.all<Color>(Colors.blue.withOpacity(0.8)),
        );
      case ButtonVariant.destructive:
        return baseStyle.copyWith(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          overlayColor:
              MaterialStateProperty.all<Color>(Colors.red.withOpacity(0.8)),
        );
      case ButtonVariant.outline:
        return baseStyle.copyWith(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(color: Colors.black),
          ),
          overlayColor:
              MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.2)),
          elevation:
              MaterialStateProperty.all<double>(0), // Set elevation to zero
        );
      case ButtonVariant.secondary:
        return baseStyle.copyWith(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          overlayColor:
              MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.8)),
        );
      case ButtonVariant.ghost:
        return baseStyle.copyWith(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          elevation: MaterialStateProperty.all<double>(0),
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        );
      case ButtonVariant.link:
        return baseStyle.copyWith(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        );
      default:
        return baseStyle;
    }
  }

  // Get padding based on button size
  EdgeInsetsGeometry _getPadding(ButtonSize size) {
    switch (size) {
      case ButtonSize.defaultSize:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      case ButtonSize.sm:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case ButtonSize.lg:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
      case ButtonSize.icon:
        return const EdgeInsets.all(2);
      default:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
    }
  }

  // Get font size based on button size
  double _getFontSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.defaultSize:
        return 16;
      case ButtonSize.sm:
        return 14;
      case ButtonSize.lg:
        return 18;
      case ButtonSize.icon:
        return 16;
      default:
        return 16;
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
