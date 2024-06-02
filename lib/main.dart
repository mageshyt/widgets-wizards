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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                CustomAlertDialog.showCustomAlert(
                  context: context,
                  alertType: AlertType.success,
                  title: 'Success',
                  text: 'Transaction Completed Successfully!',
                );
              },
              child: Text('Show Success Alert'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomAlertDialog.showCustomAlert(
                  context: context,
                  alertType: AlertType.loading,
                  title: 'Loading',
                  text: 'Fetching your data',
                );
              },
              child: Text('Show Loading Alert'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomAlertDialog.showCustomAlert(
                  context: context,
                  alertType: AlertType.custom,
                  title: 'Custom Alert',
                  text: 'This is a custom alert with a widget',
                  customAsset: 'lib/images/sasi.jpg',
                  customWidget: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter something',
                    ),
                  ),
                );
              },
              child: Text('Show Custom Alert'),
            ),
          ],
        ),
      ),
    );
  }
}
