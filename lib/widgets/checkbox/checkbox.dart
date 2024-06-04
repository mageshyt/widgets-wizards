// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:widgets_wigets/common/sizes.dart';

enum CheckBoxSize { sm, md, lg }

class CheckBoxz extends StatefulWidget {
  final String text;
  bool isSelected;
  Color? checkColor;
  Color? activeColor;
  CheckBoxSize size;

  CheckBoxz({
    Key? key,
    required this.text,
    required this.isSelected,
    this.checkColor,
    this.activeColor,
    this.size = CheckBoxSize.sm,
  }) : super(key: key);

  @override
  State<CheckBoxz> createState() => _CheckBoxzState();
}

class _CheckBoxzState extends State<CheckBoxz> {
  @override
  Widget build(BuildContext context) {
    double _getCheckBoxSize(CheckBoxSize size) {
      switch (size) {
        case CheckBoxSize.md:
          return Sizes.checkboxMd;
        case CheckBoxSize.sm:
          return Sizes.checkboxSm;
        case CheckBoxSize.lg:
          return Sizes.checkboxLg;

        default:
          return Sizes.md;
      }
    }

    return Row(
      children: [
        Transform.scale(
          scale: _getCheckBoxSize(widget.size),
          child: Checkbox(
            activeColor: widget.activeColor ?? Colors.black,
            checkColor: widget.checkColor ?? Colors.white,
            value: widget.isSelected,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onChanged: ((value) => {
                  setState(() {
                    widget.isSelected = value!;
                  })
                }),
          ),
        ),
        Text(widget.text),
      ],
    );
  }
}
