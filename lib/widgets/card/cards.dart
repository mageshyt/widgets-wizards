// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widgets_wigets/common/sizes.dart';

enum CardType { defaultCard, outlinedCard }

class CustomCard extends StatelessWidget {
  final CardHeader? header;
  final CardContent content;
  final CardFooter? footer;
  final CardType type;
  const CustomCard({
    super.key,
    required this.header,
    required this.content,
    required this.footer,
    this.type = CardType.defaultCard,
  });

  @override
  Widget build(BuildContext context) {
    // Merge custom style with variant style
    RoundedRectangleBorder _getCardStyle(BuildContext context, CardType type) {
      switch (type) {
        case CardType.outlinedCard:
          return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.borderRadiusMd),
              side: BorderSide(width: 2));
        case CardType.defaultCard:
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.borderRadiusMd),
            side: BorderSide(width: 0),
          );
      }
    }

    return Card(
      shape: _getCardStyle(context, type),
      child: Container(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          children: [
            if (header != null) header!,
            SizedBox(height: Sizes.defaultSpace),
            content,
            SizedBox(height: Sizes.defaultSpace),
            if (footer != null) footer!,
          ],
        ),
      ),
    );
  }
}

class CardHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  Widget? customWidget;
  CardHeader({
    Key? key,
    required this.title,
    this.subtitle,
    this.customWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            style: const TextStyle(
              fontSize: Sizes.fontSizeLg,
              fontWeight: FontWeight.bold,
            )),
        if (subtitle != null)
          Text(
            subtitle!,
            style: const TextStyle(
              fontSize: Sizes.fontSizesm,
              fontWeight: FontWeight.normal,
            ),
          ),
        if (customWidget != null) customWidget!,
      ],
    );
  }
}

class CardContent extends StatelessWidget {
  final List<Widget> children;
  const CardContent({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: children,
    ));
  }
}

class CardFooter extends StatelessWidget {
  final Widget? customWidget;
  const CardFooter({super.key, this.customWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: customWidget,
    );
  }
}
