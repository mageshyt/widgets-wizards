import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPField extends StatelessWidget {
  final int length;
  final double? fieldWidth;
  final FieldStyle style;
  final TextStyle? customStyle;
  const OTPField({
    super.key,
    required this.length,
    this.fieldWidth,
    required this.style,
    this.customStyle,
  });

  @override
  Widget build(BuildContext context) {
    return OTPTextField(
      keyboardType: TextInputType.number,
      length: length,
      width: MediaQuery.of(context).size.width,
      fieldWidth: fieldWidth ?? 40,
      style: customStyle ?? const TextStyle(fontSize: 17),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: style,
      onCompleted: (pin) {
        print("Completed: " + pin);
      },
    );
  }
}
