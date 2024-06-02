import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/quickalert.dart';

enum AlertType { error, info, warning, success, confirmation }

class CustomAlertDialog {
  static void showCustomAlert({
    required BuildContext context,
    required AlertType alertType,
    String? title,
    String? text,
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
      default:
        type = QuickAlertType.error;
        alertTitle = title ?? 'Error';
    }

    QuickAlert.show(
      context: context,
      type: type,
      title: alertTitle,
      text: text,
      onConfirmBtnTap: () {
        Navigator.of(context).pop(); // Close the alert
      },
    );
  }
}
