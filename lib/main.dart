import 'package:flutter/material.dart';
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
              ShadcnButton(
                variant: ButtonVariant.outline,
                size: ButtonSize.sm,
                onPressed: () => print('Button clicked'),
                text: 'Click me',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
