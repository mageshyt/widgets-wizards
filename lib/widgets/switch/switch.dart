// custom_switch.dart
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:widgets_wigets/common/colors.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final String activeText;
  final String inactiveText;
  final bool showOnOff;

  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor = ThemeColors.success,
    this.inactiveColor = ThemeColors.darkGrey,
    this.activeText = 'ON',
    this.inactiveText = 'OFF',
    this.showOnOff = true,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      value: widget.value,
      onToggle: widget.onChanged,
      activeColor: widget.activeColor,
      inactiveColor: widget.inactiveColor,
      activeText: widget.activeText,
      inactiveText: widget.inactiveText,
      showOnOff: widget.showOnOff,
    );
  }
}
