import 'package:flutter/material.dart';
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
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAvatar(
                path: "lib/images/sasi.jpg",
                size: AvatarSizes.lg,
                pathType: AvatarPathType.asset,
              )
            ],
          ),
        ),
      ),
    );
  }
}
