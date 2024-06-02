import 'package:flutter/material.dart';
import 'package:widgets_wigets/widgets/alertdialog/alertdialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quick Alert Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            CustomAlertDialog.showCustomAlert(
              context: context,
              alertType: AlertType.info,
              title: 'Success',
              text: 'Transaction Completed Successfully!',
            );
          },
          child: Text('Show Alert'),
        ),
      ),
    );
  }
}
