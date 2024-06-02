import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/quickalert.dart';
import 'package:widgets_wigets/common/colors.dart';

enum AlertType { error, info, warning, success, confirmation, loading, custom }

class CustomAlertDialog {
  static void showCustomAlert({
    required BuildContext context,
    required AlertType alertType,
    String? title,
    String? text,
    String? confirmBtnText,
    String? cancelBtnText,
    Color? confirmBtnColor,
    String? customAsset,
    Widget? customWidget,
  }) {
    QuickAlertType type;
    String alertTitle = title ?? '';

    switch (alertType) {
      case AlertType.error:
        type = QuickAlertType.error;
        alertTitle = title ?? 'Error';
        break;
      case AlertType.info:
        type = QuickAlertType.info;
        alertTitle = title ?? 'Info';
        break;
      case AlertType.warning:
        type = QuickAlertType.warning;
        alertTitle = title ?? 'Warning';
        break;
      case AlertType.success:
        type = QuickAlertType.success;
        alertTitle = title ?? 'Success';
        break;
      case AlertType.confirmation:
        type = QuickAlertType.confirm;
        alertTitle = title ?? 'Confirmation';
        break;
      case AlertType.loading:
        type = QuickAlertType.loading;
        alertTitle = title ?? 'Loading';
        break;
      case AlertType.custom:
        type = QuickAlertType.custom;
        alertTitle = title ?? 'Custom';
        break;
      default:
        type = QuickAlertType.error;
        alertTitle = title ?? 'Error';
    }

    QuickAlert.show(
      context: context,
      type: type,
      title: alertTitle.isNotEmpty ? alertTitle : null,
      text: text,
      confirmBtnText: confirmBtnText ?? "Ok",
      cancelBtnText: cancelBtnText ?? "Cancel",
      confirmBtnColor: confirmBtnColor ?? ThemeColors.primary,
      customAsset: customAsset,
      widget: customWidget,
      onConfirmBtnTap: () {
        Navigator.of(context).pop(); // Close the alert
      },
    );
  }
}
