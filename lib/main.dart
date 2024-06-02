import 'package:flutter/material.dart';
import 'package:widgets_wigets/widgets/alertdialog/alertdialog.dart';
import 'package:widgets_wigets/widgets/avatar/avatar.dart';
import 'package:widgets_wigets/widgets/button/button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Component Library',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Component Library'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAlertDialog(
                title: 'Alert',
                content: Text('This is a custom alert dialog.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      print("Hello");
                    },
                    child: Text('OK'),
                  ),
                ],
                alertType: AlertType.warning,
              )
            ],
          ),
        ),
      ),
    );
  }
}
