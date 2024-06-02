import 'package:flutter/material.dart';

enum AlertType { error, info, warning, success, confirmation }

class CustomAlertDialog extends StatelessWidget {
  final dynamic title;
  final Widget? content;
  final List<Widget>? actions;
  final AlertType? alertType;

  const CustomAlertDialog({
    Key? key,
    this.title,
    this.content,
    this.actions,
    this.alertType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor;
    switch (alertType) {
      case AlertType.error:
        backgroundColor = Colors.red[100];
        break;
      case AlertType.info:
        backgroundColor = Colors.blue[100];
        break;
      case AlertType.warning:
        backgroundColor = Colors.amber[100];
        break;
      case AlertType.success:
        backgroundColor = Colors.green[100];
        break;
      case AlertType.confirmation:
        backgroundColor = Colors.grey[100];
        break;
      default:
        backgroundColor = Colors.grey[100];
    }

    return AlertDialog(
      backgroundColor: backgroundColor,
      title: _buildTitle(),
      content: content,
      actions: actions,
    );
  }

  Widget _buildTitle() {
    if (title is String) {
      return Row(
        children: [
          if (_getIcon() != null) _getIcon()!,
          if (_getIcon() != null) const SizedBox(width: 8),
          Expanded(child: Text(title)),
        ],
      );
    } else if (title is Widget) {
      return title as Widget;
    }
    // Return an empty container if title is neither String nor Widget
    return Container();
  }

  Icon? _getIcon() {
    switch (alertType) {
      case AlertType.error:
        return const Icon(Icons.error, color: Colors.red);
      case AlertType.info:
        return const Icon(Icons.info, color: Colors.blue);
      case AlertType.warning:
        return const Icon(Icons.warning, color: Colors.amber);
      case AlertType.success:
        return const Icon(Icons.check_circle, color: Colors.green);
      case AlertType.confirmation:
        return const Icon(Icons.help_outline, color: Colors.grey);
      default:
        return null;
    }
  }
}
